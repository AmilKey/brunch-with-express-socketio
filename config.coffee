sysPath = require 'path'
fs = require 'fs'
DIR_SEP = sysPath.sep

objectify = ->
  o = {}
  for k, i in arguments by 2
    o[k] = arguments[i + 1]
  o


#TODO: find a method to do this in a cleaner way
gitHead = -> fs.readFileSync(sysPath.join('.git', 'HEAD')).toString().replace(/^\s*ref\:\s*/g, '').replace(/\s*$/g, '')
gitBranch = ->
  head = gitHead().split /\//g
  branch = head.slice()
  branch.shift()
  branch.shift()
  branch.join '/'
gitCommitHash = -> fs.readFileSync(sysPath.join('.git',
  gitHead().split(/\//g).join(DIR_SEP))).toString().replace(/^\s*/g, '').replace(/\s*$/g, '')

exports.config =
# See http://brunch.io/#documentation for documentation.
  files:
    javascripts:
      joinTo: objectify(
        "javascripts#{DIR_SEP}app.min.js", (path) -> /^app/.test(path) and not /\.prod\./.test(path)
        "javascripts#{DIR_SEP}head.min.js", (path) -> /^vendor(\/|\\)head/.test(path) and not /\.prod\./.test(path)
        "javascripts#{DIR_SEP}vendor.min.js", (path) -> /^vendor/.test(path) and not /\.prod\./.test(path) and not /.*(\/|\\)head(\/|\\).*/.test(path) and not /^vendor(\/|\\)test(\/|\\).*/.test(path) and not /.*[_].*/.test(path)
        # "test#{DIR_SEP}javascripts#{DIR_SEP}test-vendor.js", /^test(\/|\\)(?=vendor)/

        "test#{DIR_SEP}javascripts#{DIR_SEP}test-vendor.js", (path) -> /^vendor(\/|\\)test(\/|\\)scripts(\/|\\)(?!blanket|mocha-blanket)/.test(path) and not /\.prod\./.test(path)
        "test#{DIR_SEP}javascripts#{DIR_SEP}blanket.js", (path) -> /^vendor(\/|\\)test(\/|\\)scripts(\/|\\)(blanket|mocha-blanket)/.test(path) and not /\.prod\./.test(path)
        # "test#{DIR_SEP}javascripts#{DIR_SEP}test.js", (path) -> /^test/.test(path) and not /\.prod\./.test(path)
      )

      order: jsOrder =
        before: [
          "vendor#{DIR_SEP}scripts#{DIR_SEP}console-polyfill.js"
          "vendor#{DIR_SEP}scripts#{DIR_SEP}jquery.js"
          "vendor#{DIR_SEP}scripts#{DIR_SEP}bootstrap#{DIR_SEP}tooltip.js"
          "vendor#{DIR_SEP}scripts#{DIR_SEP}bootstrap#{DIR_SEP}*.js"

        ]
        after: [
          "vendor#{DIR_SEP}test#{DIR_SEP}scripts#{DIR_SEP}blanket-1.1.1.js"
          "vendor#{DIR_SEP}test#{DIR_SEP}scripts#{DIR_SEP}mocha-blanket-1.1.1.js"
          "vendor#{DIR_SEP}test#{DIR_SEP}scripts#{DIR_SEP}test-helper.js"
          "vendor#{DIR_SEP}scripts#{DIR_SEP}brunch-reload.js"
        ]

    stylesheets:
      joinTo: objectify(
        "stylesheets#{DIR_SEP}app.css", (path) ->
          # we need to exclude bootstrap files since they're included in the application.styl
          /^(app|vendor)/.test(path) and not /^vendor(\/|\\)styles(\/|\\)(bootstrap|font\-awesome)(\/|\\)/.test(path)
        "test#{DIR_SEP}stylesheets#{DIR_SEP}test.css", (path) ->/^test|vendor(\/|\\)test/.test(path)
      )
      order:
        before: [
          "vendor#{DIR_SEP}styles#{DIR_SEP}normalize.css"
        ]

      modules:
        addSourceURLs: true

# CoffeeScript easy-debugging
  sourceMaps: true

# keyword-brunch plugin
  keyword:
    map:
      git_commit_hash: gitCommitHash
      git_short_commit_hash: -> gitCommitHash().substr 0, 7
      git_branch: gitBranch


  overrides:
    production:
      optimize: yes
      sourceMaps: no
      files:
        javascripts:
          joinTo: objectify(
            "javascripts#{DIR_SEP}app.js", (path) -> /^app/.test(path) and not /\.dev\./.test(path)
            "javascripts#{DIR_SEP}vendor.min.js", (path) -> /^vendor/.test(path) and not /\.dev\./.test(path) and not /\brunch-reload\./.test(path) and not /.*(\/|\\)head(\/|\\).*/.test(path) and not /^vendor(\/|\\)test(\/|\\).*/.test(path) and not /.*[_].*/.test(path)
            "javascripts#{DIR_SEP}head.min.js", (path) -> /^vendor(\/|\\)head/.test(path) and not /\.dev\./.test(path)
          )
          order: jsOrder
      plugins:
        autoreload:
          enabled: no

# configs for start server
  server:
    path: 'server.coffee'
    port: process.env.PORT or 3333
    #listen: process.env.IP or 'localhost'
    base: '/'
    app: 'express'
    debug: 'brunch:server'
    persistent: true
    interval: 100
    watched: ['app', 'express']
    ignore: /(^[.#]|(?:~)$)/
    source: /.*\.coffee$/
    linter:
      enabled: on
      coffeelint:
        pattern: /.*\.coffee$/
        options:
          indentation:
            value: 2
            level: "error"
          max_line_length:
            value: 255
    tester:
      enabled: on
      mocha:
        pattern: /^.*_test\.coffee$/
        options:
          reporter:'spec'

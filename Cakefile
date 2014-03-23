http = require 'http'
https = require 'https'
fs = require 'fs'
child_process = require 'child_process'


# Cleanup build directory
task 'clean', 'cleanup build folders and files', (options) ->
  console.log 'Cleaning up build directories...'
  child_process.exec 'rm -rf public'


# Build a production release
task 'build', 'build a production release', (options) ->
  console.log 'Building production ready release...'
  child_process.exec 'rm -rf public public.tgz', (err) ->
    throw err if err
    child_process.exec 'brunch build --production', (err) ->
      throw err if err
      child_process.exec 'tar czf public.tgz public', (err) ->
        console.info 'Production ready build done and packed in public.tgz, check public directory'


# Test runner
task 'test', 'run unit tests', ->
  server = (require 'karma').server
  server.start configFile: './test/karma.conf.js', (exitCode) ->
    console.log "Karma has exited with #{exitCode}"
    process.exit exitCode


# Get the latest Bootstrap (stylus version)
task 'update-bootstrap', 'download the latest Twitter Bootstrap javascript and stylus files', (options) ->
  console.log "Downloading the latest sources for Twitter Bootstrap..."
  fs.mkdir 'tmp', (err) ->
    throw err if err
    cmd = '''
      git clone https://github.com/Acquisio/bootstrap-stylus.git &&
      cd bootstrap-stylus &&
      rm ../../vendor/scripts/bootstrap/*.js ../../vendor/styles/bootstrap/*.styl &&
      cp js/*.js ../../vendor/scripts/bootstrap/ &&
      cp stylus/*.styl ../../vendor/styles/bootstrap/ &&
      cp fonts/* ../../app/assets/fonts/
      '''
    child_process.exec cmd, cwd: fs.realpathSync('tmp'), (err, stdout, stderr) ->
      throw err if err
      child_process.exec 'rm -rf tmp'


# Get the latests Font Awesome (stylus version)
task 'update-font-awesome', 'download the latest Font Bootstrap font and stylus files', (options) ->
  console.log "Downloading the latest sources for Font Awesome..."
  fs.mkdir 'tmp', (err) ->
    throw err if err
    cmd = '''
      git clone https://github.com/MarcelloDiSimone/Font-Awesome.git &&
      cd Font-Awesome &&
      mkdir -p ../../vendor/styles/font-awesome
      rm -f ../../vendor/styles/font-awesome/*.styl
      cp stylus/*.styl ../../vendor/styles/font-awesome/ &&
      cat stylus/variables.styl | sed s/"..\\/font"/"..\\/fonts"/ > ../../vendor/styles/font-awesome/variables.styl
      rm -f ../../app/assets/fonts/fontawesome-webfont.* &&
      cp font/fontawesome-webfont.* ../../app/assets/fonts/
      '''
    child_process.exec cmd, cwd: fs.realpathSync('tmp'), (err, stdout, stderr) ->
      throw err if err
      child_process.exec 'rm -rf tmp'


packages = [
    {
        name: 'Twitter Bootstrap'
        version: '3.0.0'
        desc: 'Sleek, intuitive, and powerful front-end framework for faster and
         easier web development. A 12-column responsive grid, dozens of
         components, JavaScript plugins, typography, form controls, and even a
         web-based Customizer to make Bootstrap your own.'
        url: 'http://twitter.github.com/bootstrap/'
    },{
        name: 'jQuery'
        version: '2.0.3'
        desc: 'jQuery is a fast and concise JavaScript Library that simplifies
         HTML document traversing, event handling, animating, and Ajax
         interactions for rapid web development. jQuery is designed to change
         the way that you write JavaScript.'
        url: 'http://jquery.com/'
    },{
        name: 'H5BP'
        version: '4.2.0'
        desc: 'HTML5 Boilerplate helps you build fast, robust, and adaptable web
         apps or sites. Kick-start your project with the combined knowledge and
         effort of 100s of developers, all in one little package.<br/><br/>
         Includes: <br/><strong>Moderizer <small>v2.6.2</small></strong> &amp;
         <strong>Normalize.css <small>v1.1.0</small></strong>'
        url: 'http://html5boilerplate.com/'
    },{
        name: 'Underscore'
        version: '1.4.4'
        desc: 'Underscore is a utility-belt library for JavaScript that provides
         a lot of the functional programming support that you would expect in
         Prototype.js (or Ruby), but without extending any of the built-in
         JavaScript objects. It\'s the tie to go along with jQuery\'s tux, and
         Backbone.js\'s suspenders.'
        url: 'http://underscorejs.org/'
    },{
        name: 'Font Awesome'
        version: '3.1.0'
        desc: '<i class="icon-thumbs-up"></i>  The iconic font designed for use
         with Twitter Bootstrap.<br/><br/> <i class="icon-flag"></i>  In a
         single collection, Font Awesome is a pictographic language of
         web-related actions.<br/><br/> <i class="icon-pencil"></i> Easily
         style icon color, size, shadow, and anything that\'s possible with
         CSS.'
        url: 'http://fortawesome.github.com/Font-Awesome/'
    }
]

exports.index = (title, version) ->
  (req, res) ->
    copy = packages.slice()
    res.render 'index', {title: title, version: version, packages: copy}

exports.error = (title, errnum) ->
  (req, res, next) ->
    res.render errnum, {title: title, errnum: errnum}, (err, html) ->
      return next err if err
      res.send errnum, html

exports.test = (title) ->
  (req, res) ->
    res.render 'test', {title: title}
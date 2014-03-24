# Brunch with Express, Socket.IO, Jade
An up-to-date [Brunch](http://brunch.io) skeleton for developing clean Web App applications with ease.

It was based on the skeleton from Denis Trayzhon [brunch-with-ember-and-express](https://https://github.com/denya133/brunch-with-ember-and-express) and
the skeleton from Jeremy Fowler [ExpressBrunchJade](https://github.com/jerfowler/ExpressBrunchJade) but is now much more updated and complex now, tho I'd prefer to keep my original source.

Also 

the skeleton from Elving Rodriguez [brunch-with-hipsters](https://github.com/elving/brunch-with-hipsters) 
which was used for organizing code of express application on Node.js  


## Versions
- [jQuery v2.0.3](http://jquery.com)
- [HTML5 Boilerplate v4.2.0](http://html5boilerplate.com)
- [Twitter Bootstrap v3.0.0](https://github.com/twitter/bootstrap)
- [Font Awesome v3.1.0](http://fontawesome.io)
- [Underscore v1.4.4](http://underscorejs.org/)


## Features
- **CoffeeScript** - a little language that compiles into JavaScript.
- **Stylus** - Expressive, dynamic, robust CSS pre-processor.
- **auto-reload-brunch** - Adds automatic browser reloading support to brunch.
- **uglify-js-brunch** - Adds UglifyJS support to brunch.
- **keyword-brunch** - Adds Keyword support to brunch to replace some variables in the generated sources.


## Getting started
Create a new project using this skeleton:
```
brunch new gh:AmilKey/brunch-with-express-socketio <appname>
cd <appname>
git init
git add .
git commit -m "repo init"
brunch watch --server
```
Open [http://localhost:3333](http://localhost:3333) on your browser.


## Production release
To create a production release (smaller vendor files, js and css packed), use the cake build command:
```
cake build
```
It'll generate a production ready `public` and create an archive of it in `public.tgz` that you can then backup or send to your servers.


## Generators
This skeleton makes use of [scaffolt](https://github.com/paulmillr/scaffolt#readme) generators to help you create common files quicker. To use first install scaffolt globally with `npm install -g scaffolt`. Then you can use the following command to generate files.

Generating files of Express App

```
scaffolt express_route <name>		→ express/routes/name.coffee
		=> 	exports.name = (options) ->
				  (req, res) ->
				    res.render 'name', {options: options}

scaffolt express_view <name>		→ express/views/name.jade
		=> 	extends layout

				block content

				// {{name}}
```

* There's a few more commands you can use with `scaffolt` and also instruction on how to create your own generators, so make sure you check out the [docs](https://github.com/paulmillr/scaffolt#readme).
* Each generator will automatically add the generated files to the corresponding initializer coffee file so that you won't have to add them yourself.


## Testing
You can write your tests in the `test` folder, just make sure they are named `*_test.coffee`. You can customize the test to user PhantomJS, Chrome, Firefox, Safari or Opera on the `test/karma.conf.js` file. There's a lot of other settings there as well. Run tests with:

```
cake test
```

## Updating
You have some `cake` tasks to help you update *ember*, *ember-data* and *ember-bootstrap*. More to come in the future.
```bash
# update Twitter Bootstrap:
cake update-bootstrap
# update Font Awesome:
cake update-font-awesome
```

## License
All of brunch-with-express-socketio is licensed under the MIT license.

Copyright (c) 2014 Ivan Kobzar

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

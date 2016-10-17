# Backbone seed project

_Short description.._

## App tech stack

- BackboneJS
- MarionetteJS

## Development tools

- Browserify
- Grunt
- Sass
- CoffeeScript
- NPM

# Getting started

## Prerequisites

- `curl -L https://npmjs.org/install.sh | sh` | _Install Node and NPM_
- `npm install -g grunt-cli` | _Install the Grunt command-line interface globally_
- `npm install -g bower` | _(Install bower through npm globally)_
- `npm install -g coffee-script` | _Install CoffeeScript globally_
- `git clone git@github.com:miphe/backbone-seed.git` | _Clone repository_

## Install project

- `npm install` | _Install all node dependencies locally_
- `bower install` _(Install all bower dependencies locally)_

## Start development

- `grunt dev-s` | _Run a few select grunt tasks and spin up HTTP server_

The server can be reached at `localhost:9001`

In case you feel like running a different HTTP server, have a look at `Gruntfile.js` to see which tasks are available to you there.

# Documentation

When running `grunt dev-d` or `grunt dev-sd` you will automatically generate all front-end documentation. The generated pages are ignored by git.

The documentation will land in the /docs folder under /sassdoc and /jsdoc, they are not a part of the Backbone application. You can view this either with any HTTP server, or simply running it's index.html page in a browser.

## Sass
Sass documentation is generated with [SassDoc](http://sassdoc.com/) in JSDoc style.

## CoffeeScript

CoffeeScript documentation is generated from .js files with [JSDoc](http://usejsdoc.org/) in JSDoc style. However, with CoffeeScript the regular JSDoc comments will be invalid. To comment documentation JSDoc style with CoffeeScript, write it like this:

```
###*
# onStart hook
# Runs appropriate setup when application starts
# @param {object} options Options where environment variables and initial setup data is supplied
# @example
# onStart: ({env: {..}, rootView: '#some-root-view-id'}) ->
#   // Do things..
###
```

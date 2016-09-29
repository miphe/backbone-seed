
Backbone = require 'backbone'
Mn       = require 'backbone.marionette'
_        = require 'underscore'
tpl      = require './templates/start.html'

Start = {}

# MODEL
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Start.Model = {}

class Start.Model.ExampleModel extends Backbone.Model
  defaults:
    status: 'FAILED'

# COLLECTION
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Start.Collection = {}

# VIEW
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Start.View = {}

class Start.View.ExampleView extends Mn.View
  tagName: 'section'
  className: 'example-view'
  template: tpl.greeting

module.exports = Start

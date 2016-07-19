
Backbone = require 'backbone'
Mn       = require 'backbone.marionette'
_        = require 'underscore'
tpl      = require './templates/start.html'

Start = {}

# MODEL
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Start.Model = {}

Start.Model.ExampleModel = Backbone.Model.extend
  defaults:
    status: 'FAILED'

# COLLECTION
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Start.Collection = {}

# VIEW
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Start.View = {}

Start.View.ExampleView = Mn.ItemView.extend
  tagName: 'section'
  className: 'example-view'
  template: tpl.greeting

module.exports = Start

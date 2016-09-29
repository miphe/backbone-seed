
Backbone = require 'backbone'
Mn       = require 'backbone.marionette'
Routers  = require './routers.coffee'
AppView  = require './utils/app-view.coffee'

config = require './config.coffee'

class App extends Mn.Application

  region: config.ROOTVIEW,

  onBeforeStart: ->
    @rootRegion = @getRegion()
    @rootView = new AppView
    @rtrs = new Routers
    @rtrs.setup()

  ###*
  # TODO: Fix how options work here..
  # Runs appropriate setup when application starts
  # @param {object} options Options where environment variables and initial setup data is supplied
  # @example
  # onStart: ({env: {..}, rootView: '#some-root-view-id'}) ->
  #   // Do things..
  ###
  onStart: (options) ->
    @rootRegion.show @rootView
    Backbone.history.start({ pushState: true }) if Backbone.history

# Application instantiation and boot
app = new App
app.start config.options

# Exports the application instance
module.exports = app

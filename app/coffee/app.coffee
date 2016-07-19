
Backbone = require 'backbone'
Mn = require 'backbone.marionette'
Rtr = require './routers.coffee'

config = require './config.coffee'

App = Mn.Application.extend

  ###*
  * Runs appropriate setup when application starts
  * @param {object} options Options where environment variables and initial setup data is supplied
  * @example
  * onStart: ({env: {..}, rootView: '#some-root-view-id'}) ->
  *   // Do things..
  ###
  onStart: (options) ->
    console.log 'Starting application with options:', options
    Backbone.history.start({ pushState: true }) if Backbone.history

# Application instantiation and boot
app = new App

app.start config.options

module.exports = App

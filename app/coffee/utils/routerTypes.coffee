
Mn = require 'backbone.marionette'
ebus = require './ebus.coffee'

Routers = {}

# Base router
# Extends Marionette's AppRouter with following functionality:
# Triggers navigation event to ebus onRoute
Routers.Base = Mn.AppRouter.extend

  ###*
  * When a route occurs, the 'route' event is triggered on the event bus.
  ###
  onRoute: (name, path, args) ->
    ebus.Navigate.trigger 'route', name

module.exports = Routers

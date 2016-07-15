
Mn = require 'backbone.marionette'
EBus = require './ebus.coffee'

Routers = {}

# Base router
# Extends Marionette's AppRouter with following functionality:
# Triggers navigation event to EBus onRoute
Routers.Base = Mn.AppRouter.extend
  onRoute: (name, path, args) ->
    EBus.Navigate.trigger 'route', name

module.exports = Routers


Mn = require 'backbone.marionette'
Radio = require 'backbone.radio'

Routers = {}

# Base router
class Routers.Base extends Mn.AppRouter

  ###*
  * When a route occurs, the 'route' event is triggered on the navigate channel.
  ###
  onRoute: (name, path, args) ->
    Radio.channel('navigate').trigger 'route', name

module.exports = Routers

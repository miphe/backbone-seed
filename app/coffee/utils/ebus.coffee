
EBus = require './event-bus.coffee'

# Prepares an instantiated object of event channels
EventBusInstance =
  Navigate: new EBus.Navigate
  MainChannel: new EBus.MainChannel

module.exports = EventBusInstance

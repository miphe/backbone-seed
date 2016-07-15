
# Routers
StartRouter   = require './start/start.router.coffee'
EBus          = require './utils/ebus.coffee'

Routers =
  StartRouter:   new StartRouter()

module.exports = Routers

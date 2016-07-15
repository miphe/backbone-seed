
Mn        = require 'backbone.marionette'
StartCtrl = require './start.ctrl.coffee'
Rt        = require '../utils/routerTypes.coffee'

module.exports = Rt.Base.extend

  controller: StartCtrl

  appRoutes:
    '': 'index'

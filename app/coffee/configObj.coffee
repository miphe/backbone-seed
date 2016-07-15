
Mn = require 'backbone.marionette'

ConfigObj = Mn.Object.extend
  initialize: (opts) ->
    console.log 'ConfigObj:init'

module.exports = ConfigObj

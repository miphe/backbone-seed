
ConfigObj = require './configObj.coffee'

config = new ConfigObj
  ENVIRONMENT: window.env
  ROOTVIEW: '#root-view'

module.exports = config

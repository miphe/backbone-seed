
Mn = require 'backbone.marionette'

Regions =

  Content: new Mn.RegionManager
    regions:
      main: 'main > .inner'

  Statics: new Mn.RegionManager
    regions:
      header: 'header'

module.exports = Regions


Mn = require 'backbone.marionette'

RegionManager = Mn.RegionManager.extend({})

Content = new RegionManager
  regions:
    main   : 'main > .inner'

Statics = new RegionManager
  regions:
    header : 'header'

module.exports =

  # Region manager instance (root region manager)
  Content: Content
  Statics: Statics

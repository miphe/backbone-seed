
_        = require 'underscore'
Backbone = require 'backbone'

Region  = require '../utils/region.coffee'
Start   = require '../start/start.coffee'

StartCtrl =

  index: ->
    console.log 'StartCtrl:index'

    # GlMa.setPageLayout ['l-main', 'shy-header', 'l-front']
    # Region.Others.emptyRegions()
    # Region.Content.emptyRegions()

    # layoutModel = new Start.Model.Form

    # Views area
    # ~~~~~~~~~~~~~~

    exampleView = new Start.View.ExampleView
      model: new Start.Model.ExampleModel
        status: 'WORKING'

    # Rendering area
    # ~~~~~~~~~~~~~~

    Region.Content.get('main').show exampleView

module.exports = _.extend(StartCtrl, Backbone.Events)

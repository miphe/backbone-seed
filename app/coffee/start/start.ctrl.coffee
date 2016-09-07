
_        = require 'underscore'
Backbone = require 'backbone'

Region  = require '../utils/region.coffee'
Start   = require './start.coffee'
UI      = require '../components/ui-tabs.coffee'

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

    # Example of a tab ui component
    # tabUICollection = new UI.Collection.Navigation
    # tabUICollection.add { label: 'Number one!' }
    # tabUICollection.add { active: true, label: 'Second comes here' }
    # tabUICollection.add { label: 'And the last one' }
    #
    # tabNav = new UI.View.NavigationList
    #   collection: tabUICollection
    #
    # tabContent = new UI.View.TabContentList
    #   collection: tabUICollection

    # Rendering area
    # ~~~~~~~~~~~~~~

    Region.Content.get('main').show exampleView

    # Tab ui component example
    # Region.Statics.get('header').show tabNav
    # Region.Content.get('main').show tabContent

module.exports = _.extend(StartCtrl, Backbone.Events)

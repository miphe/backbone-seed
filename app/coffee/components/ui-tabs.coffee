
Mn =       require 'backbone.marionette'
Backbone = require 'backbone'
$ =        require 'jquery'
_ =        require 'underscore'
EBus =     require '../utils/ebus.coffee'
F =        require '../utils/functions.coffee'

tpl = {}
tpl.tabs = require './templates/ui-tabs.html'

UITabs = {}

# MODEL
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

UITabs.Model = {}

# UI Tabs navigation item model
# Attributes explained:
# - id:        Random generated string that will be used to programatically
#              map the tab's navigation item and it's content area.
# - reference: String that will be used to find the correct
#              template to load in the tab's content area.
# - label:     The text that will show on the tab navigation item.
UITabs.Model.Navigation = Backbone.Model.extend

  initialize: ->

    # Makes sure each ID is unique
    @set 'id', F.randomID('#id-xyxx-4xyx')

  defaults:
    id: null
    label: 'Example label'
    active: false

# COLLECTION
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

UITabs.Collection = {}

UITabs.Collection.Navigation = Backbone.Collection.extend
  model: UITabs.Model.Navigation

  initialize: ->
    @listenTo @, 'change:active', @setNewActiveModel

  # Implements the notion that there may be only one active model.
  # When a model is activated, all others are deactivated.
  setNewActiveModel: (modl, state) ->

    # Only proceed in case the change was to activate a model.
    return unless state
    others = @without(@models, modl)

    # Deactivated all 'other' models.
    _.each others, (mdl) ->
      mdl.set 'active', false

# VIEW
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

UITabs.View = {}

UITabs.View.TabContentItem = Mn.ItemView.extend
  template: tpl.tabs.content_item
  tagName: 'section'
  className: ->
    classes = ['ui-tabs-content-item']
    classes.push 'is-hidden' unless @model.get('active') is true
    return classes.join ' '

  initialize: ->
    @listenTo @model, 'change:active', @update

  update: (modl, state) ->
    do @activateMe if state is true
    do @deActivateMe if state is not true

  activateMe: ->
    @$el.removeClass 'is-hidden'

  deActivateMe: ->
    @$el.addClass 'is-hidden'

UITabs.View.TabContentList = Mn.CollectionView.extend
  className: 'ui-tabs-content-outer ui-tabs-content-bordered'
  childView: UITabs.View.TabContentItem

UITabs.View.NavigationItem = Mn.ItemView.extend
  template: tpl.tabs.nav_item
  tagName: 'li'

  initialize: ->
    @listenTo @model, 'change:active', @update

  events:
    'click @ui.anchor': 'activate'

  ui:
    anchor: '.ui-tabs-navigation-anchor'

  update: (modl, state) ->
    do @activateMe if state is true
    do @deActivateMe if state is not true

  activate: (e) ->
    e.preventDefault()
    @model.set 'active', true
    @trigger 'tab:active', 'UI-tabs, tab clicked.'

  activateMe: (e) ->
    @$el.find(@ui.anchor).addClass 'is-active'

  deActivateMe: ->
    @$el.find(@ui.anchor).removeClass 'is-active'

UITabs.View.NavigationList = Mn.CollectionView.extend
  tagName: 'ul'
  className: ->

    # Classes:
    # 'ui-tabs-navigation-list' => Mandatory
    # 'ui-tabs-nav-bordered'
    # 'ui-tabs-nav-bordered', 'ui-tabs-nav-full', 'has-3-items'
    # 'ui-tabs-nav-lined'

    # Comment out the classes you don't need
    return [
      'ui-tabs-navigation-list'
      # 'ui-tabs-nav-lined'
      'ui-tabs-nav-bordered'
      'ui-tabs-nav-full'
      'has-3-items'
    ].join(' ')
  childView: UITabs.View.NavigationItem

module.exports = UITabs

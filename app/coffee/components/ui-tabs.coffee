
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
# - reference: String that will be used to find the correct
#              template to load in the tab's content area.
# - label:     The text that will show on the tab navigation item.
UITabs.Model.Navigation = Backbone.Model.extend

  defaults:
    label: 'Example label'
    active: false

# COLLECTION
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

UITabs.Collection = {}

UITabs.Collection.Navigation = Backbone.Collection.extend
  model: UITabs.Model.Navigation

  ###*
  * Listens to change on the 'active' attribute on each model.
  ###
  initialize: ->
    @listenTo @, 'change:active', @setNewActiveModel

  ###*
  * Sets a new active model in the collection.
  * All other models will then be set to inactive.
  * @param {object} modl - New active model.
  * @param {boolean} state - Value of the 'active' attribute on the model (the attribute that changed)
  ###
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

  ###*
  * Sets appropriate classes to this view.
  * One mandatory class, a show/hide class, and theme classes.
  * If model's 'active' attribute is true, this view will not be hidden.
  * This method should not be overridden unless invoked on prototype.
  ###
  className: ->
    classes = ['ui-tabs-content-item']
    classes.push 'is-hidden' unless @model.get('active') is true
    return classes.join ' '

  ###*
  * Listens to change on the 'active' attribute on this model.
  ###
  initialize: ->
    @listenTo @model, 'change:active', @update

  ###*
  * Invokes update methods according to 'active' state.
  ###
  update: (modl, state) ->
    do @activateMe if state is true
    do @deActivateMe if state is not true

  ###*
  * Activates view according to 'active' state.
  ###
  activateMe: ->
    @$el.removeClass 'is-hidden'

  ###*
  * Deactivates view according to 'active' state.
  ###
  deActivateMe: ->
    @$el.addClass 'is-hidden'

UITabs.View.TabContentList = Mn.CollectionView.extend
  className: 'ui-tabs-content-outer ui-tabs-content-bordered'
  childView: UITabs.View.TabContentItem

UITabs.View.NavigationItem = Mn.ItemView.extend
  template: tpl.tabs.nav_item
  tagName: 'li'

  ###*
  * Listens to change on the 'active' attribute on this model.
  ###
  initialize: ->
    @listenTo @model, 'change:active', @update

  events:
    'click @ui.anchor': 'activate'

  ui:
    anchor: '.ui-tabs-navigation-anchor'

  ###*
  * Invokes DOM update methods according to 'active' state.
  ###
  update: (modl, state) ->
    do @activateMe if state is true
    do @deActivateMe if state is not true

  ###*
  * Updates model upon UI interaction.
  * Also triggers event on this view.
  ###
  activate: (e) ->
    e.preventDefault()
    @model.set 'active', true
    @trigger 'tab:active', 'UI-tabs, tab clicked.'

  ###*
  * Activates view according to 'active' state.
  ###
  activateMe: (e) ->
    @$el.find(@ui.anchor).addClass 'is-active'

  ###*
  * Deactivates view according to 'active' state.
  ###
  deActivateMe: ->
    @$el.find(@ui.anchor).removeClass 'is-active'

UITabs.View.NavigationList = Mn.CollectionView.extend
  tagName: 'ul'

  ###*
  * Sets appropriate classes to this view.
  * One mandatory class, theme classes.
  * Classes:
  * 'ui-tabs-navigation-list' => Mandatory
  * 'ui-tabs-nav-bordered'
  * 'ui-tabs-nav-bordered', 'ui-tabs-nav-full', 'has-3-items'
  * 'ui-tabs-nav-lined'
  ###
  className: ->

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


Mn     = require 'backbone.marionette'
Radio  = require 'backbone.radio'
_      = require 'underscore'
config = require '../config.coffee'

tpl    = require './templates/app-views.html'

class AppView extends Mn.View
  template: tpl.app_view

  className: -> config.ROOTVIEWNAME + '-inner'

  initialize: ->

    # Event structure: 'VERB:WHAT:WHERE'
    # Examples: 'show:view:main'
    #           'destroy:view:footer'
    #           'get:view:sidebar-1'
    @listenTo Radio.channel('app'), 'show:view:main', @showInMain
    @listenTo Radio.channel('app'), 'show:view:header', @showInHeader

    @listenTo Radio.channel('dialog'), 'open', @openDialog
    @listenTo Radio.channel('dialog'), 'close', @closeDialog

  showInMain: (view) ->
    @showChildView 'main', view

  showInHeader: (view) ->
    @showChildView 'header', view

  # TODO: support options etc.
  openDialog: (view) ->
    @showChildView 'dialog', view

  closeDialog: (view) ->
    @getRegion('dialog').reset()

  regions:
    main: '.inner'
    header: 'header'
    dialog: '.dialog-content'

module.exports = AppView

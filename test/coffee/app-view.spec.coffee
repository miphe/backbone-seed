
expect = require('chai').expect
Mn = require 'backbone.marionette'

AppView = require '../../app/coffee/utils/app-view.coffee'
appView = null

module.exports = describe 'AppView, application base view', ->

  describe 'Class', ->

    it 'should exist', ->
      expect(AppView).to.exist

  describe 'Instance', ->

    beforeEach ->
      appView = new AppView

    afterEach ->
      appView = null

    it 'should extend Mn.View', ->
      expect(appView).to.be.instanceof Mn.View

    it.skip 'should set className depending on ROOTVIEWNAME config', ->

    it.skip 'should have appropriate regions', ->

    it.skip 'should run appropriate methods when Radio channel "app" hears events', ->
      # trigger events on radio
      # check that methods are being called

    it.skip 'showInMain should showChildView in main region', ->

    it.skip 'showInHeader should showChildView in header region', ->

    it.skip 'should run appropriate methods when Radio channel "dialog" hears events', ->

    it.skip 'openDialog should showChildView in dialog region', ->

    it.skip 'closeDialog should reset in dialog region', ->

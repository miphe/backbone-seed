
expect = require('chai').expect
sinon = require 'sinon'
Mn = require 'backbone.marionette'

EBus = require '../../app/coffee/utils/event-bus.coffee'
ebus = require '../../app/coffee/utils/ebus.coffee'

navigateInstance = null

describe 'Utilities (Utils)', ->

  describe 'Event bus (EBus)', ->

    it 'exists', ->
      expect(ebus).to.exist

    it 'is an object', ->
      expect(ebus).to.be.an 'object'
      expect(ebus).to.not.be.instanceof Mn.Object

    it 'has a Main channel', ->
      expect(ebus).to.have.property 'MainChannel'
      expect(ebus.MainChannel).to.not.be.empty
      expect(ebus.MainChannel).to.be.instanceof Mn.Object

    it 'has a Navigation channel', ->
      expect(ebus).to.have.property 'Navigate'
      expect(ebus.Navigate).to.not.be.empty
      expect(ebus.Navigate).to.be.instanceof Mn.Object

    describe 'Navigate channel', ->

      # This suite is as of now not testable due to each channel
      # being an instance of a Marionette object.
      # Until further investigations has been done and methods
      # on instances of Marionette objects can be mocked/stubbed
      # we leave this suite as it, unfinished.

      beforeEach ->
        navigateInstance = sinon.createStubInstance EBus.Navigate

      afterEach ->
        navigateInstance.restore()

      it.skip 'invokes page title method on all events', ->
        expect(navigateInstance.updatePageTitle.notCalled).to.be.true

        navigateInstance.trigger 'some-random-event'

        expect(navigateInstance.updatePageTitle.callCount).to.equal 1
        expect(navigateInstance.updatePageTitle.calledWith('some-random-event').callCount).to.equal 1


expect     = require('chai').expect
sinon      = require 'sinon'
Mn         = require 'backbone.marionette'
Radio      = require 'backbone.radio'

Routers    = require '../../app/coffee/utils/routerTypes.coffee'
someRouter = null
navChannel = null

module.exports = describe 'Router types', ->

  describe 'Base router', ->
    it 'should exist', ->
      expect(Routers).to.exist
      expect(Routers).to.be.an 'object'
      expect(Routers).to.not.be.empty
      expect(Routers).to.have.property 'Base'
      expect(Routers.Base).to.exist

    it 'should be a function', ->
      expect(Routers.Base).to.be.a 'function'

    it 'should not be empty', ->
      expect(Routers.Base).to.not.be.empty

    describe 'Instance', ->

      navChannel = Radio.channel('navigate')

      beforeEach ->
        someRouter = new Routers.Base
        sinon.stub navChannel, 'trigger'

      afterEach ->
        someRouter = null
        navChannel.trigger.restore()

      it 'should be an instance of Marionette AppRouter', ->
        expect(someRouter).to.be.instanceof Mn.AppRouter

      it 'should trigger route events on route', ->
        expect(someRouter).to.have.property 'onRoute'
        expect(someRouter.onRoute).to.be.a 'function'
        someRouter.onRoute 'route-name', '/some/route', { a: 'b' }

        expect(navChannel.trigger.calledOnce).to.be.true
        expect(navChannel.trigger.calledWith('route')).to.be.true
        expect(navChannel.trigger.calledWith('route', 'route-name'), 'calledWith "route" and "route-name" params').to.be.true

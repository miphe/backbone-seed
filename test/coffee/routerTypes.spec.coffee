
expect = require('chai').expect
sinon = require 'sinon'
Mn = require 'backbone.marionette'

Routers = require '../../app/coffee/utils/routerTypes.coffee'
ebus = require '../../app/coffee/utils/ebus.coffee'
someRouter = null
meth = null

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

    describe 'instance', ->

      beforeEach ->
        meth = sinon.stub ebus.Navigate, 'trigger'
        someRouter = new Routers.Base

      afterEach ->
        meth.restore()
        someRouter = null

      it 'should be an instance of Marionette AppRouter', ->
        expect(someRouter).to.be.instanceof Mn.AppRouter

      it 'should run EBus trigger method when routing', ->
        expect(someRouter).to.have.property 'onRoute'
        expect(someRouter.onRoute).to.be.a 'function'
        someRouter.onRoute 'route-name', '/some/route', { a: 'b' }

        expect(meth.calledOnce).to.be.true
        expect(meth.calledWith('route', 'route-name'), 'calledWith "route" and "route-name" params').to.be.true


expect = require('chai').expect
sinon = require 'sinon'
$ = require 'jquery'

glob = require '../../app/coffee/utils/glob.coffee'
config = require '../../app/coffee/config.coffee'

stub = spy = null
defaultPageTitle = null
$el = null

module.exports = describe 'Global methods', ->

  describe 'test markup document', ->

    it 'should find 1 body element', ->
      expect($('body').length, 'Seems test markup could not find 1 body element').to.equal 1

    it 'should find 1 page layout element', ->
      expect($('.' + config.LAYOUT_EL_CLASS).length, 'Seems test markup could not find 1 layout element').to.equal 1

  describe 'setPageLayout', ->

    afterEach ->
      stub = null

    it 'should exist', ->
      expect(glob.setPageLayout).to.exist
      expect(glob.setPageLayout).to.be.a 'function'

    it 'should use configured layout class and apply classes to body and layout element', ->
      pageLayoutClass = config.LAYOUT_EL_CLASS
      additionalClass = 'some-random-class'
      expectedBodyClass = 'body-' + pageLayoutClass + ' body-' + additionalClass
      expectedElClass = pageLayoutClass + ' ' + additionalClass

      stub = sinon.stub $, 'attr'

      glob.setPageLayout [additionalClass]

      expect(stub.calledWith(sinon.match({ nodeName: "BODY" }), 'class', expectedBodyClass), 'function not called with correct args, when trying to set body class').to.be.true
      expect(stub.calledWith(sinon.match({ className: pageLayoutClass, nodeName: "DIV" }), 'class', expectedElClass), 'function not called with correct args, when trying to set ' + pageLayoutClass + ' class').to.be.true

      stub.restore()

  describe 'getPageLayout', ->

    it 'should exist', ->
      expect(glob.getPageLayout).to.exist
      expect(glob.getPageLayout).to.be.a 'function'

    it 'should return .' + config.LAYOUT_EL_CLASS + ' class', ->
      cls = glob.getPageLayout()
      expect(cls).to.include config.LAYOUT_EL_CLASS

    it 'should return all page layout classes', ->
      testClasses = ['class-a', 'class-b', 'class-c']
      glob.setPageLayout testClasses
      cls = glob.getPageLayout()
      expect(cls).to.include 'class-a'
      expect(cls).to.include 'class-b'
      expect(cls).to.include 'class-c'
      expect(cls).to.not.include 'class-d'
      expect(cls).to.include config.LAYOUT_EL_CLASS

      # Reset to normal
      glob.setPageLayout []

    it 'should reset classes to normal', ->
      testClasses = ['class-a', 'class-b', 'class-c']
      glob.setPageLayout testClasses
      cls = glob.getPageLayout()

      expect(cls).to.include 'class-b'

      # Reset to normal
      glob.setPageLayout []
      cls = glob.getPageLayout()

      expect(cls).to.not.include 'class-a'
      expect(cls).to.not.include 'class-b'
      expect(cls).to.not.include 'class-c'
      expect(cls).to.include config.LAYOUT_EL_CLASS

  describe 'updatePageTitle', ->

    beforeEach ->
      defaultPageTitle = $('head').find('title').text()

    afterEach ->
      $('head').find('title').text defaultPageTitle

    it 'exists', ->
      expect(glob.updatePageTitle).to.exist

    it 'updates page title by navigation event', ->
      expect(defaultPageTitle).to.equal 'Backbone seed test suite'
      glob.updatePageTitle 'login'

      newPageTitle = $('head').find('title').text()
      expect(newPageTitle).to.equal 'Log in | Backbone project'

    it 'updates page title to default when called without navigation event', ->
      expect(defaultPageTitle).to.equal 'Backbone seed test suite'
      glob.updatePageTitle 'non-existing-event'

      newPageTitle = $('head').find('title').text()
      expect(newPageTitle).to.equal 'Welcome to your new Backbone project!'

  describe 'removeEventHandlers', ->

    beforeEach ->

      # Add an element to the DOM to mess around with.
      $el = $('<a id="el-reh">Remove event handler from me plz.</a>')
      $('body').append $el

      spy = sinon.spy $el, 'off'

      # Add event handler to $el
      $el.on 'click', (e) ->
        console.log 'Handler invoked.'

    afterEach ->

      spy.restore()
      spy = null

      # Remove element added in beforeEach
      $el.remove()

    # This method is unfinished
    it.skip 'calls `off` on selector', ->

      $el.trigger 'click'

      glob.removeEventHandlers 'click', '#el-reh'
      console.log spy.firstCall
      # expect(spy.calledOnce).to.be.true
      # expect(spy.calledWith)
      $el.trigger 'click'


    it.skip 'calls `off` with correct event', ->
      #..

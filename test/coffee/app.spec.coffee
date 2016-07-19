
expect = require('chai').expect
Mn = require 'backbone.marionette'
# sinon = require 'sinon'

ConfigObj = require '../../app/coffee/configObj.coffee'
config = require '../../app/coffee/config.coffee'

module.exports = describe 'Application setup', ->
  describe 'Configuration', ->
    it 'should find config instance', ->
      expect(config).to.exist
      expect(config).to.be.an 'object'

    it 'should be an instance of ConfigObj', ->
      expect(ConfigObj).to.exist
      expect(ConfigObj).to.be.a 'function'
      expect(config).to.be.an.instanceof Mn.Object
      expect(config).to.be.an.instanceof ConfigObj

    it 'should access config values', ->
      fullEnv = config.getOption('ENVIRONMENT')
      env = config.getOption('ENVIRONMENT').environment

      expect(env).to.exist
      expect(env).to.be.a 'string'
      expect(env).to.equal 'development'

      expect(fullEnv).to.exist
      expect(fullEnv).to.be.an 'object'
      expect(fullEnv).to.not.be.empty

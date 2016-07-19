
expect = require('chai').expect
Mn = require 'backbone.marionette'

config = require '../../app/coffee/config.coffee'

module.exports = describe 'Application setup', ->
  describe 'Configuration', ->
    it 'should find config instance', ->
      expect(config).to.exist
      expect(config).to.be.an 'object'

    it 'should access config values', ->
      fullEnv = config.ENVIRONMENT
      env = config.ENVIRONMENT.environment

      expect(env).to.exist
      expect(env).to.be.a 'string'
      expect(env).to.equal 'development'

      expect(fullEnv).to.exist
      expect(fullEnv).to.be.an 'object'
      expect(fullEnv).to.not.be.empty

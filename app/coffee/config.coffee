
_ = require 'underscore'

env = window.env

# Set up environment variables
# Based on window.env object, please set this up appropriately to your env.
env = _.extend env,
  development: env.environment is 'development'
  test:        env.environment is 'test'
  production:  env.environment is 'production'

config =
  ENVIRONMENT: env
  ROOTVIEW: '#root-view'
  ROOTVIEWNAME: 'root-view'
  LAYOUT_EL_CLASS: 'page-layout'

module.exports = config

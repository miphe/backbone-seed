
# Require all suites
require './app.spec.coffee'
require './utils.spec.coffee'
require './routerTypes.spec.coffee'
require './region.spec.coffee'

# Setup Mocha
mocha.checkLeaks()
mocha.run()

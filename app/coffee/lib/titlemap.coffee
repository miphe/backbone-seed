
Mn   = require 'backbone.marionette'

# Translates navigation events to page titles.
# Fill in your application's titles here.
# Each navigation event (on the left) corresponds to
# a page title (on the right).
Titles = Mn.Object.extend

  'home': 'Welcome to your new Backbone project!'
  'login': 'Log in | Backbone project'
  'logout': 'Log out | Backbone project'
  # ...

module.exports = new Titles

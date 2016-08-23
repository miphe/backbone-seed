
$ = require 'jquery'
_ = require 'underscore'
T = require '../lib/titlemap.coffee'
config = require '../config.coffee'

# Global methods
# These methods are out of scope from views
# and even out of scope from Backbone. You
# may require this file and invoke methods
# as you please, they will not create list-
# eners or emit events.

module.exports =

  ###*
  * Updates body element with page layout classes.
  * Also update specified page-layout element with classes.
  * @param {array} layout - List of classes.
  * @todo This should be handled by a view instead of globally.
  ###
  setPageLayout: (layout) ->
    pageLayoutClass = config.LAYOUT_EL_CLASS
    cls = [pageLayoutClass]
    _.each layout, (clss) ->
      cls.push clss

    # Updates body element with layout classes
    $('body').attr('class', _.map(cls, (c) ->
      'body-' + c
    ).join(' '))

    # Updates layout element with layout classes
    $('.' + pageLayoutClass).attr 'class', cls.join(' ')

  ###*
  * Fetch the current page-layout classes.
  * @returns {array} All current page-layout classes
  ###
  getPageLayout: ->
    pageLayoutClass = config.LAYOUT_EL_CLASS
    $('.' + pageLayoutClass).attr('class').split ' '

  ###*
  * Updates page title
  * If field exists in titlemap, use that, otherwise default
  * @param {string} event - Event used to lookup new page title
  ###
  updatePageTitle: (event) ->
    newTitle = T.getOption event
    $('head > title').html newTitle or 'Welcome to your new Backbone project!'

  removeEventHandlers: (event, selector) ->
    $(selector).off event

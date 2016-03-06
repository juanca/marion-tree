Marionette = require 'backbone.marionette'
HeaderRow = require './header-row'

class Grid extends Marionette.LayoutView
  className: 'grid'
  template: -> '''
    <div class='header-region'></div>
  '''

  regions: ->
    header: '.header-region'

  initialize: ({ @collection, @columns }) ->

  onRender: ->
    @header.show new HeaderRow collection: @columns

module.exports = Grid

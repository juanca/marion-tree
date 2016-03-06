Marionette = require 'backbone.marionette'
Header = require './header'

class Grid extends Marionette.LayoutView
  className: 'grid'
  template: -> '''
    <div class='header-region'></div>
  '''

  regions: ->
    header: '.header-region'

  initialize: ({ @collection, @columns }) ->

  onRender: ->
    @header.show new Header collection: @columns

module.exports = Grid

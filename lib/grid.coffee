Marionette = require 'backbone.marionette'
Header = require './header'

class Grid extends Marionette.LayoutView
  className: 'grid'
  template: -> '''
    <div class='header-region'></div>
  '''

  regions: ->
    header: '.header-region'

  onRender: ->
    @header.show new Header

module.exports = Grid

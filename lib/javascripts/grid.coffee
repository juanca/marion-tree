require '../stylesheets/grid'

Marionette = require 'backbone.marionette'
HeaderRow = require './header-row'
Body = require './body'

class Grid extends Marionette.LayoutView
  className: -> 'grid'
  template: -> '''
    <div class='header-region'></div>
    <div class='body-region'></div>
  '''

  regions: ->
    header: '.header-region'
    body: '.body-region'

  initialize: ({ @collection, @columns }) ->

  onRender: ->
    @header.show new HeaderRow { @columns }
    @body.show new Body { @collection, @columns }

module.exports = Grid

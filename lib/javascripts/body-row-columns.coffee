require '../stylesheets/body-row-columns'

Marionette = require 'backbone.marionette'
DefaultCell = require './cells/string-cell'

class BodyRowColumns extends Marionette.CollectionView
  className: -> 'body-row-columns'

  childView: DefaultCell
  getChildView: (column) ->
    column.get('cell') ? @childView

  childViewOptions: (column) ->
    { column, @model }

  initialize: ({ @columns, @model }) ->
    @collection = @columns

module.exports = BodyRowColumns

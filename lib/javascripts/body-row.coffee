require '../stylesheets/body-row'

Marionette = require 'backbone.marionette'
DefaultCell = require './cells/string-cell'

class BodyRow extends Marionette.CollectionView
  className: -> 'body-row'

  childView: DefaultCell
  getChildView: (column) ->
    column.get('cell') ? @childView

  childViewOptions: (column) ->
    { column, @model }

  initialize: ({ @columns, @model }) ->
    @collection = @columns

module.exports = BodyRow

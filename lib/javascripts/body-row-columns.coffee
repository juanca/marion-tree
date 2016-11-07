require '../stylesheets/body-row-columns'

Marionette = require 'backbone.marionette'
DefaultCell = require './cells/string-cell'

class BodyRowColumns extends Marionette.CollectionView
  className: -> 'body-row-columns'

  childView: DefaultCell
  getChildView: (column) ->
    if column.get 'cells'
      this.constructor
    else
      column.get('cell') ? @childView

  childViewOptions: (column) ->
    if column.get 'cells'
      columns = new Backbone.Collection column.get('cells')
      { columns, @model }
    else
      { column, @model }

  sort: false

  initialize: ({ @columns, @model }) ->
    @collection = @columns

module.exports = BodyRowColumns

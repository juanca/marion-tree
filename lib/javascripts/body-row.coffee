require '../stylesheets/body-row'

Marionette = require 'backbone.marionette'
DefaultCell = require './cells/string-cell'

class BodyRow extends Marionette.CollectionView
  className: -> 'body-row'

  getChildView: (column) ->
    DefaultCell

  childViewOptions: (column) ->
    { column, @model }

  initialize: ({ @columns, @model }) ->
    @collection = @columns

module.exports = BodyRow

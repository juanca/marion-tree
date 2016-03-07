require '../stylesheets/header-row'

Marionette = require 'backbone.marionette'
DefaultHeaderCell = require './header-cells/string-cell'

class HeaderRow extends Marionette.CollectionView
  className: -> 'header-row'

  getChildView: (column) ->
    DefaultHeaderCell

  initialize: ({ @columns }) ->
    @collection = @columns

module.exports = HeaderRow

require '../stylesheets/header-row'

Marionette = require 'backbone.marionette'
DefaultHeaderCell = require './header-cells/string-cell'

class HeaderRow extends Marionette.CollectionView
  className: -> 'header-row'

  childView: DefaultHeaderCell
  getChildView: (column) ->
    column.get('headerCell') ? @childView

  sort: false

  initialize: ({ @columns }) ->
    @collection = @columns

module.exports = HeaderRow

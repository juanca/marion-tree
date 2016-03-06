require '!style!css!sass!../stylesheets/header-row.scss'

Marionette = require 'backbone.marionette'
DefaultHeaderCell = require './header-cells/string-cell'

class HeaderRow extends Marionette.CollectionView
  className: 'header-row'

  getChildView: (column) ->
    DefaultHeaderCell

module.exports = HeaderRow

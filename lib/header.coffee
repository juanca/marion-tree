Marionette = require 'backbone.marionette'
DefaultHeaderCell = require './header-cells/string-cell'

class Header extends Marionette.CollectionView
  className: 'header'

  getChildView: (column) ->
    DefaultHeaderCell

module.exports = Header

require '../../stylesheets/header-cells/string-cell'

Marionette = require 'backbone.marionette'
_ = require 'underscore'

class StringCell extends Marionette.ItemView
  className: -> 'header-cells-string-cell'
  template: _.template '<%- label %>'

module.exports = StringCell

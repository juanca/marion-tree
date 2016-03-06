Marionette = require 'backbone.marionette'
_ = require 'underscore'

class StringCell extends Marionette.ItemView
  className: -> 'string-cell'
  template: _.template '<%- label %>'

module.exports = StringCell

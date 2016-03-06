require '../../stylesheets/cells/string-cell'

Marionette = require 'backbone.marionette'
_ = require 'underscore'

class StringCell extends Marionette.ItemView
  className: -> 'cells-string-cell'
  template: _.template '<%- text %>'

  templateHelpers: ->
    text: @model.get @column.get('name')

  initialize: ({ @column }) ->

module.exports = StringCell

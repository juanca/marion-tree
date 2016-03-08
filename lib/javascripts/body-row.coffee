require '../stylesheets/body-row'

Marionette = require 'backbone.marionette'
BodyRowColumns = require './body-row-columns'

class BodyRow extends Marionette.LayoutView
  className: -> 'body-row'
  template: -> '''
    <div class='body-row-columns-region'></div>
  '''

  regions: ->
    columnsView: '.body-row-columns-region'

  initialize: ({ @columns, @model }) ->

  onRender: ->
    @columnsView.show new BodyRowColumns { @columns, @model }

module.exports = BodyRow

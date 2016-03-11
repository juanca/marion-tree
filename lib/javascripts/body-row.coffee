require '../stylesheets/body-row'

Marionette = require 'backbone.marionette'
BodyRowColumns = require './body-row-columns'

class BodyRow extends Marionette.LayoutView
  className: -> 'body-row'
  template: -> '''
    <div class='body-row-columns-region'></div>
    <div class='body-region'></div>
  '''

  regions: ->
    columnsView: '.body-row-columns-region'
    body: '.body-region'

  initialize: ({ @columns, @model, @collection, @bodyView }) ->

  onRender: ->
    @columnsView.show new BodyRowColumns { @columns, @model }
    @body.show new @bodyView { @collection, @columns }

module.exports = BodyRow

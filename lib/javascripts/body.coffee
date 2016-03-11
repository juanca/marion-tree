require '../stylesheets/body'

Marionette = require 'backbone.marionette'
BodyRow = require './body-row'

class Body extends Marionette.CollectionView
  className: -> 'body'

  childView: BodyRow
  childViewOptions: (model) ->
    columns: @columns
    model: model

  initialize: ({ @columns, @collection }) ->

module.exports = Body

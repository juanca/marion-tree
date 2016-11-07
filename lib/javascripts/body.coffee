require '../stylesheets/body'

Marionette = require 'backbone.marionette'
BodyRow = require './body-row'

class Body extends Marionette.CollectionView
  className: -> 'body'

  childView: BodyRow
  childViewOptions: (model) ->
    columns: @columns
    model: model
    collection: model.get('collection') # should default to something else? or allow ovverride
    bodyView: this.constructor

  sort: false

  initialize: ({ @columns, @collection }) ->

module.exports = Body

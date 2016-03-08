require '../stylesheets/body'

Marionette = require 'backbone.marionette'
BodyRowColumns = require './body-row-columns'

class Body extends Marionette.CollectionView
  className: -> 'body'

  childView: BodyRowColumns
  childViewOptions: (model) ->
    { @columns, model }

  initialize: ({ @columns, @collection }) ->

module.exports = Body

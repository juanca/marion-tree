require '../stylesheets/body'

Marionette = require 'backbone.marionette'
BodyRow = require './body-row'

class Body extends Marionette.CollectionView
  className: -> 'body'

  childView: BodyRow

module.exports = Body

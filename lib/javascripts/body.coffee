require '../stylesheets/body'

Marionette = require 'backbone.marionette'

class Body extends Marionette.CollectionView
  className: -> 'body'

module.exports = Body

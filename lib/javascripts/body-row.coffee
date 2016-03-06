require '../stylesheets/body-row'

Marionette = require 'backbone.marionette'

class BodyRow extends Marionette.CollectionView
  className: -> 'body-row'

module.exports = BodyRow

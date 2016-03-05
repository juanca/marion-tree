describe 'Grid', ->
  Marionette = require 'backbone.marionette'
  Grid = require '../lib/Grid'

  it 'is a layout view', ->
    expect(new Grid).toBeInstanceOf Marionette.LayoutView

describe 'Grid', ->
  Marionette = require 'backbone.marionette'
  Grid = require '../lib/Grid'

  initView = ->
    new Grid

  it 'is a layout view', ->
    expect(initView()).toEqual jasmine.any Marionette.LayoutView

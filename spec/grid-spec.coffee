describe 'Grid', ->
  Marionette = require 'backbone.marionette'
  Grid = require '../lib/Grid'
  Header = require '../lib/Header'

  initView = ->
    new Grid

  showView = ->
    initView(arguments...).render()

  it 'is a layout view', ->
    expect(initView()).toEqual jasmine.any Marionette.LayoutView

  describe 'header region', ->
    it 'has a header row', ->
      expect(showView().$('.header-region')).not.toBeEmpty()

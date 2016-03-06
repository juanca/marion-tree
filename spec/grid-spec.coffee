describe 'Grid', ->
  Marionette = require 'backbone.marionette'
  Grid = require '../lib/Grid'
  Header = require '../lib/Header'

  initView = ({ columns, collection } = {}) ->
    columns ?= new Backbone.Collection [
      label: 'iamlabel'
    ,
      label: 'iamotherlabel'
    ]

    collection ?= new Backbone.Collection [
      {}
    ]

    new Grid { columns, collection }

  showView = ->
    initView(arguments...).render()

  it 'is a layout view', ->
    expect(initView()).toEqual jasmine.any Marionette.LayoutView

  describe 'header region', ->
    it 'has a header row', ->
      grid = showView()
      expect(grid.$('.header-region')).not.toBeEmpty()
      expect(grid.header.currentView.$el.children()).toHaveLength(2)

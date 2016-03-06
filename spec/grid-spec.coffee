describe 'Grid', ->
  Grid = require '../lib/javascripts/grid'

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

  it 'has a className', ->
    expect(showView().$el).toHaveClass 'grid'

  describe 'header region', ->
    it 'has a header row', ->
      grid = showView()
      expect(grid.$('.header-region')).not.toBeEmpty()
      expect(grid.header.currentView.$el.children()).toHaveLength(2)

describe 'Grid', ->
  Grid = require '../lib/javascripts/grid'
  view = null

  initView = ({ columns, collection } = {}) ->
    columns ?= new Backbone.Collection [
      label: 'iamlabel'
    ,
      label: 'iamotherlabel'
    ]

    collection ?= new Backbone.Collection [
      {}
    ]

    view = new Grid { columns, collection }

  showView = ->
    initView(arguments...).render()

  afterEach ->
    view?.destroy()
    view = null

  it 'has a className', ->
    expect(showView().$el).toHaveClass 'grid'

  describe 'header region', ->
    it 'has a header row', ->
      showView()
      expect(view.$('.header-region')).not.toBeEmpty()
      expect(view.header.currentView.$el.children()).toHaveLength(2)
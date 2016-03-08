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
      { foo: 'some model' }
      { foo: 'some actor' }
      { foo: 'perhaps a model' }
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

  describe 'body region', ->
    it 'has many body row', ->
      showView()
      expect(view.$('.body-region')).not.toBeEmpty()
      expect(view.body.currentView.$el.children()).toHaveLength(3)

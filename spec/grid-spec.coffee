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
      initView()
      view.headerView = Backbone.Marionette.ItemView.extend
        template: -> 'header view'

      view.render()
      expect(view.$('.header-region')).not.toBeEmpty()
      expect(view.header.currentView.$el).toHaveText 'header view'

    it 'has a default header row', ->
      showView()
      expect(view.$('.header-region')).not.toBeEmpty()
      expect(view.header.currentView.$el.children()).toHaveLength(2)

  describe 'body region', ->
    it 'has a header row', ->
      initView()
      view.bodyView = Backbone.Marionette.ItemView.extend
        template: -> 'body view'

      view.render()
      expect(view.$('.body-region')).not.toBeEmpty()
      expect(view.body.currentView.$el).toHaveText 'body view'

    it 'has many default body rows', ->
      showView()
      expect(view.$('.body-region')).not.toBeEmpty()
      expect(view.body.currentView.$el.children()).toHaveLength(3)

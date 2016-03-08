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
      { foo: 'some model', bar: 'some bar', baz: 'bezz' }
      { foo: 'some actor', bar: 'some diner', baz: 'bizz' }
      { foo: 'perhaps a model', bar: 'bar?', baz: 'bozz' }
    ]

    view = new Grid { columns, collection }

  showView = ->
    initView(arguments...).render()

  afterEach ->
    view?.destroy()
    view = null

  it 'has a className', ->
    expect(showView().$el).toHaveClass 'grid'

  it 'defaults all attributes as string columns', ->
    collection = new Backbone.Collection [
      { foo: 'some model', bar: 'some bar', baz: 'bezz' }
      { foo: 'some actor', bar: 'some diner', baz: 'bizz' }
      { foo: 'perhaps a model', bar: 'bar?', baz: 'bozz' }
    ]

    view = (new Grid { collection }).render()

    renderedLabels = view.header.currentView.children.map (headerCell) -> headerCell.$el.text()
    expect(renderedLabels).toEqual ['foo', 'bar', 'baz']

    renderedCells = view.body.currentView.children.map (bodyRow) ->
      bodyRow.columnsView.currentView.children.map (cell) -> cell.$el.text()

    expect(renderedCells).toEqual [
      ['some model', 'some bar', 'bezz']
      ['some actor', 'some diner', 'bizz']
      ['perhaps a model', 'bar?', 'bozz']
    ]

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

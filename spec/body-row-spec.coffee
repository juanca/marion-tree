describe 'BodyRow', ->
  BodyRow = require '../lib/javascripts/body-row'
  Body = require '../lib/javascripts/body'
  view = null

  initView = ({ columns, model } = {}) ->
    columns ?= new Backbone.Collection [
      { name: 'greeting' }
      { name: 'everyone' }
    ]

    model ?=  new Backbone.Model
      greeting: 'hola'
      everyone: 'todos'
      collection: new Backbone.Collection [
        { greeting: 'hola1', everyone: 'todos1' }
        { greeting: 'hola2', everyone: 'todos2' }
        { greeting: 'hola3', everyone: 'todos3' }
      ]

    view = new BodyRow
      columns: columns
      model: model
      collection: model.get('collection')
      bodyView: Body

  showView = ->
    initView(arguments...).render()

  afterEach ->
    view?.destroy()
    view = null

  it 'has a className', ->
    expect(showView().$el).toHaveClass 'body-row'

  describe 'columns region', ->
    it 'has many body row columns', ->
      showView()
      expect(view.$('.body-row-columns-region')).not.toBeEmpty()
      expect(view.columnsView.currentView.$el.children()).toHaveLength(2)

  describe 'body region', ->
    it 'has many body rows', ->
      showView()
      expect(view.$('.body-region')).not.toBeEmpty()
      expect(view.body.currentView.$el.children()).toHaveLength(3)

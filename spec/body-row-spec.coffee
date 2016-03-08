describe 'BodyRow', ->
  BodyRow = require '../lib/javascripts/body-row'
  view = null

  initView = ({ columns, model } = {}) ->
    columns ?= new Backbone.Collection [
      { name: 'greeting' }
      { name: 'everyone' }
    ]

    model ?=  new Backbone.Model
      greeting: 'hola'
      everyone: 'todos'

    view = new BodyRow { columns, model }

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

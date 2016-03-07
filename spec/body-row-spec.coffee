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

  it 'defaults the childView to a StringCell', ->
    showView().children.each (stringCellView) ->
      value = stringCellView.model.get(stringCellView.column.get('name'))
      expect(stringCellView.$el).toHaveText value

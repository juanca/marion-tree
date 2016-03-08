describe 'BodyRowColumns', ->
  BodyRowColumns = require '../lib/javascripts/body-row-columns'
  view = null

  initView = ({ columns, model } = {}) ->
    columns ?= new Backbone.Collection [
      { name: 'greeting' }
      { name: 'everyone' }
    ]

    model ?=  new Backbone.Model
      greeting: 'hola'
      everyone: 'todos'

    view = new BodyRowColumns { columns, model }

  showView = ->
    initView(arguments...).render()

  afterEach ->
    view?.destroy()
    view = null

  it 'has a className', ->
    expect(showView().$el).toHaveClass 'body-row-columns'

  it 'defaults the childView to a StringCell', ->
    renderedText = showView().children.map (stringCellView) -> stringCellView.$el.text()
    expect(renderedText).toEqual ['hola', 'todos']

  it 'uses the cell of the column', ->
    showView columns: new Backbone.Collection [
      { cell: Backbone.Marionette.ItemView.extend template: -> 'hello' }
      { cell: Backbone.Marionette.ItemView.extend template: -> 'world' }
    ]

    renderedText = view.children.map (stringCellView) -> stringCellView.$el.text()
    expect(renderedText).toEqual ['hello', 'world']

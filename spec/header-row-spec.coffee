describe 'Header', ->
  HeaderRow = require '../lib/javascripts/header-row'
  view = null

  initView = ({ columns } = {}) ->
    columns ?= new Backbone.Collection [
      { label: 'iamlabel' }
      { label: 'iamotherlabel' }
    ]

    view = new HeaderRow { columns }

  showView = ->
    initView(arguments...).render()

  afterEach ->
    view?.destroy()
    view = null

  it 'has a className', ->
    expect(showView().$el).toHaveClass 'header-row'

  it 'defaults the childView to a StringCell', ->
    showView().children.each (stringCell) ->
      expect(stringCell.$el).toHaveText stringCell.model.get('label')

  it 'uses the headerCell of the column', ->
    showView columns: new Backbone.Collection [
      { headerCell: Backbone.Marionette.ItemView.extend template: -> 'hello' }
      { headerCell: Backbone.Marionette.ItemView.extend template: -> 'world' }
    ]

    renderedText = view.children.map (stringCellView) -> stringCellView.$el.text()
    expect(renderedText).toEqual ['hello', 'world']

describe 'HeaderCells StringCell', ->
  HeaderCell = require '../../lib/javascripts/header-cells/string-cell'
  view = null

  initView = ({ model } = {}) ->
    model ?= new Backbone.Model label: 'header cell label'
    new HeaderCell { model }

  showView = ->
    initView(arguments...).render()

  afterEach ->
    view?.destroy()
    view = null

  it 'renders the label', ->
    expect(showView().$el).toHaveText 'header cell label'

  it 'has a className', ->
    expect(showView().$el).toHaveClass 'header-cells-string-cell'

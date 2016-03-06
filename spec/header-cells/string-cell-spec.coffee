describe 'HeaderCells StringCell', ->
  HeaderCell = require '../../lib/header-cells/string-cell'

  initView = ({ model } = {}) ->
    model ?= new Backbone.Model label: 'header cell label'
    new HeaderCell { model }

  showView = ->
    initView(arguments...).render()

  it 'renders the label', ->
    expect(showView().$el).toHaveText 'header cell label'

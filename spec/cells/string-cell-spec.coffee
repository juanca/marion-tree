describe 'Cells StringCell', ->
  Cell = require '../../lib/javascripts/cells/string-cell'

  initView = ({ column, model } = {}) ->
    column ?= new Backbone.Model name: 'someAttribute'
    model ?= new Backbone.Model someAttribute: 'some attribute value'
    new Cell { column, model }

  showView = ->
    initView(arguments...).render()

  it 'has a className', ->
    expect(showView().$el).toHaveClass 'cells-string-cell'

  it 'renders the attribute value of the model specified by the column', ->
    expect(showView().$el).toHaveText 'some attribute value'

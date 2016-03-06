describe 'BodyRow', ->
  BodyRow = require '../lib/javascripts/body-row'

  initView = ({ columns } = {}) ->
    new BodyRow

  showView = ->
    initView(arguments...).render()

  it 'has a className', ->
    expect(showView().$el).toHaveClass 'body-row'

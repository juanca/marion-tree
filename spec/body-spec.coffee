describe 'Body', ->
  Body = require '../lib/javascripts/body'

  initView = ({ columns } = {}) ->
    new Body

  showView = ->
    initView(arguments...).render()

  it 'has a className', ->
    expect(showView().$el).toHaveClass 'body'

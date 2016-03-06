describe 'Body', ->
  Body = require '../lib/javascripts/body'

  initView = ({ collection } = {}) ->
    collection ?= new Backbone.Collection [
      { foo: 'foo', bar: 'bar' }
    ]
    new Body { collection }

  showView = ->
    initView(arguments...).render()

  it 'has a className', ->
    expect(showView().$el).toHaveClass 'body'

  it 'has many body rows', ->
    expect(showView().$el.children).not.toBeEmpty()

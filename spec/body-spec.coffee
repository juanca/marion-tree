describe 'Body', ->
  Body = require '../lib/javascripts/body'
  view = null

  initView = ({ collection } = {}) ->
    collection ?= new Backbone.Collection [
      { foo: 'foo', bar: 'bar' }
    ]

    view = new Body { collection }

  showView = ->
    initView(arguments...).render()

  afterEach ->
    view?.destroy()
    view = null

  it 'has a className', ->
    expect(showView().$el).toHaveClass 'body'

  it 'has many body rows', ->
    expect(showView().$el).not.toBeEmpty()

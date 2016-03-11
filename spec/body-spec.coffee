describe 'Body', ->
  Body = require '../lib/javascripts/body'
  view = null

  initView = ({ collection, nestedCollection } = {}) ->
    nestedCollection ?= new Backbone.Collection
    collection ?= new Backbone.Collection [
      { foo: 'foo', bar: 'bar', collection: nestedCollection }
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

  describe 'body row options', ->
    options = null

    beforeEach ->
      initView()
      options = view.childViewOptions(view.collection.first())

    it 'has a columns reference', ->
      expect(options.columns).toBe view.columns

    it 'has a model reference', ->
      expect(options.model).toBe view.collection.first()

    it 'has a collection reference', ->
      expect(options.collection).toBe view.collection.first().get('collection')

    it 'has a bodyView reference', ->
      expect(options.bodyView).toBe view.constructor

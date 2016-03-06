describe 'Grid', ->
  Marionette = require 'backbone.marionette'
  Header = require '../lib/Header'

  initView = ->
    new Header

  showView = ->
    initView(arguments...).render()

  it 'is a collection view', ->
    expect(initView()).toEqual jasmine.any Marionette.CollectionView

describe 'Header', ->
  Marionette = require 'backbone.marionette'
  Header = require '../lib/Header'

  initView = ({ columns } = {}) ->
    columns ?= new Backbone.Collection [
      label: 'iamlabel'
    ,
      label: 'iamotherlabel'
    ]

    new Header { collection: columns }

  showView = ->
    initView(arguments...).render()

  it 'is a collection view', ->
    expect(initView()).toEqual jasmine.any Marionette.CollectionView

  it 'defaults the childView to a StringCell', ->
    header = showView()

    header.children.each (stringCell) ->
      expect(stringCell.$el).toHaveText stringCell.model.get('label')

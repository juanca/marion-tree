describe 'Header', ->
  HeaderRow = require '../lib/javascripts/header-row'

  initView = ({ columns } = {}) ->
    columns ?= new Backbone.Collection [
      label: 'iamlabel'
    ,
      label: 'iamotherlabel'
    ]

    new HeaderRow { collection: columns }

  showView = ->
    initView(arguments...).render()

  it 'has a className', ->
    expect(showView().$el).toHaveClass 'header-row'

  it 'defaults the childView to a StringCell', ->
    header = showView()

    header.children.each (stringCell) ->
      expect(stringCell.$el).toHaveText stringCell.model.get('label')

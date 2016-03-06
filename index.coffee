document.write 'i dunno why i have to write or something to get body working T____T'

$ = require 'jquery'
Marionette = require 'backbone.marionette'
Grid = require './lib/grid'

columns = new Backbone.Collection [
  label: 'hello'
,
  label: 'world'
]

grid = new Grid { columns }
grid.render()

$('body').html(grid.$el)

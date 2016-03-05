document.write 'i dunno why i have to write or something to get body working T____T'

$ = require 'jquery'
Grid = require './lib/grid'

grid = new Grid
grid.render()

$('body').html(grid.$el)

document.write 'i dunno why i have to write or something to get body working T____T'

Grid = require './lib/grid'

columns = new Backbone.Collection [
  label: 'hello'
,
  label: 'world'
]

grid = new Grid { columns }
grid.render()

document.querySelector('body').appendChild(grid.el)

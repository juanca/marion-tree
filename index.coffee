Grid = require './lib/javascripts/grid'

collection = new Backbone.Collection [
  { greeting: 'hola', everyone: 'todos', boop: 'boop' }
  { greeting: 'hey', everyone: 'yall', boop: 'boop' }
  { greeting: 'beep', everyone: 'boop', boop: 'boop' }
]

grid = new Grid { collection }
grid.render()

document.querySelector('body').appendChild(grid.el)

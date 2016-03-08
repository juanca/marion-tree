Grid = require './lib/javascripts/grid'

collection = new Backbone.Collection [
  { greeting: 'hola', everyone: 'todos', boop: 'boop' }
  { greeting: 'hey', everyone: 'yall', boop: 'boop' }
  { greeting: 'beep', everyone: 'boop', boop: 'boop' }
]

grid = new Grid { collection }
grid.render()

document.querySelector('body').appendChild(grid.el).appendChild(document.createElement('br'))

columns = new Backbone.Collection [
  { label: 'hello', name: 'greeting' }
  { label: 'world', name: 'everyone' }
]

collection = new Backbone.Collection [
  { greeting: 'hola', everyone: 'todos'}
  { greeting: 'hey', everyone: 'yall'}
  { greeting: 'beep', everyone: 'boop'}
]

grid = new Grid { collection, columns }
grid.render()

document.querySelector('body').appendChild(grid.el).appendChild(document.createElement('br'))

document.write("It works.")

Player = require './lib/jasmine_examples/Player'
Song = require './lib/jasmine_examples/Song'
player = new Player
song = new Song
player.play song

module.exports = player

webpack = require 'webpack'

module.exports =
  entry:
    dist: './index.coffee'
    externals: ['jquery', 'underscore', 'backbone.marionette'],
  output:
    path: __dirname
    filename: 'marionette-tree.js'
    libraryTarget: 'this'
    library: 'MarionetteTree'
  module:
    loaders: [
      { test: /\.coffee$/, loader: 'coffee' }
      { test: /\.scss$/, loaders: ['style', 'css', 'sass'] }
    ]
  resolve:
    extensions: ['', '.coffee', '.scss']
  plugins: [
    new webpack.optimize.CommonsChunkPlugin 'externals', 'marionette-tree.externals.js'
  ]

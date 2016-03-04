module.exports =
  entry: './index.coffee'
  output:
    path: __dirname
    filename: 'index.js'
  module:
    loaders: [
      { test: /\.coffee$/, loader: 'coffee' }
    ]
  resolve:
    extensions: ['', '.web.coffee', '.web.js', '.coffee', '.js']

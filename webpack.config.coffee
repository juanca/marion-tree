module.exports =
  entry: './index.coffee'
  output:
    path: __dirname
    filename: 'index.js'
  module:
    loaders: [
      { test: /\.coffee$/, loader: 'coffee' }
      { test: /\.scss$/, loaders: ['style', 'css', 'sass'] }
    ]
  resolve:
    extensions: ['', '.coffee', '.scss']

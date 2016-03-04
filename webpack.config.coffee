module.exports =
  entry: './index.coffee'
  output:
    path: __dirname
    filename: 'index.js'
    libraryTarget: 'var'
    library: 'Foo'
  module:
    loaders: [
      { test: /\.coffee$/, loader: 'coffee' }
    ]
  resolve:
    extensions: ['', '.web.coffee', '.web.js', '.coffee', '.js']

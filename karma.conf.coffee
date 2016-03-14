webpackConfig = require('./webpack.config.coffee')
webpackConfig.entry = {}
webpackConfig.plugins = []

module.exports = (config)  ->
  config.set
    frameworks: ['jasmine']
    browsers: ['Chrome']

    files: [
      './spec/**/*.coffee'
    ]

    preprocessors:
      './spec/helpers/**/*': ['webpack']
      './spec/**/*': ['webpack']

    webpack: webpackConfig

    webpackMiddleware:
      noInfo: true

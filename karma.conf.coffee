webpackConfig = require('./webpack.config.coffee')
webpackConfig.entry = {}

module.exports = (config)  ->
  config.set
    frameworks: ['jasmine']
    browsers: ['Chrome']

    files: [
      './spec/**/*.coffee'
    ]

    preprocessors:
      './spec/**/*spec.coffee': ['webpack']

    webpack: webpackConfig

    webpackMiddleware:
      noInfo: true

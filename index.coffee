$ = require 'jquery'
_ = require 'underscore'

document.write("It works!")

M = require 'backbone.marionette'

document.write("Backbone.Marionette!")

m = new M.ItemView
m.template = _.template 'poop'

document.write("Backbone.Marionette.ItemView!")

m.render()

$('body').append(m.$el)

window.Mccluskyfrontend =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Data: {}
  init: ->
    'use strict'
    console.log 'Hello from Backbone!'
    Backbone.history.start()

$ ->
  'use strict'
  Mccluskyfrontend.init();

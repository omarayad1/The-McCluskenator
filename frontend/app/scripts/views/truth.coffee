'use strict';

class Mccluskyfrontend.Views.Truth extends Backbone.View

  template: JST['app/scripts/templates/truth.ejs']

  tagName: 'div'

  id: ''

  className: ''

  events: {}

  render: () ->
    table = @collection
    @$el.html @template({'collection': table})
    @

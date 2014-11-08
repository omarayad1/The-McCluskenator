'use strict';

class Mccluskyfrontend.Views.Final extends Backbone.View

  template: JST['app/scripts/templates/final.ejs']

  tagName: 'div'

  id: ''

  className: ''

  events: {}

  render: () ->
    batee5 = @collection
    @$el.html @template({'collection': batee5})
    @

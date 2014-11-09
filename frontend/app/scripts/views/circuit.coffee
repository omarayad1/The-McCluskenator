'use strict';

class Mccluskyfrontend.Views.Circuit extends Backbone.View

  template: JST['app/scripts/templates/circuit.ejs']

  tagName: 'div'

  id: ''

  className: ''

  events: {}

  render: () ->
    batee5 = @collection
    @$el.html @template({'collection': batee5})
    @

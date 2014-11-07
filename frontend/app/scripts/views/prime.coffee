'use strict';

class Mccluskyfrontend.Views.Prime extends Backbone.View

  template: JST['app/scripts/templates/prime.ejs']

  tagName: 'div'

  id: ''

  className: ''

  events: {}
  render: () ->
    implicants = @collection
    @$el.html @template({'collection': implicants})
    @

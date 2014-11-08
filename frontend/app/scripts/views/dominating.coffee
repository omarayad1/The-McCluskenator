'use strict';

class Mccluskyfrontend.Views.Dominating extends Backbone.View

  template: JST['app/scripts/templates/dominating.ejs']

  tagName: 'div'

  id: ''

  className: ''

  events: {
    'click a.dominating-next': 'getFinal'
  }
  getFinal: ->
  	window.location.href = 'http://localhost:9000/#/final'
  render: () ->
    implicants = @collection
    @$el.html @template({'collection': implicants})
    @
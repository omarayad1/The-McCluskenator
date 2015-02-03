'use strict';

class Mccluskyfrontend.Views.Final extends Backbone.View

  template: JST['app/scripts/templates/final.ejs']

  tagName: 'div'

  id: ''

  className: ''

  events: {
  	'click a.final-next': 'getCircuit'
  }
  getCircuit: ->
  	Backbone.history.navigate('circuit', {trigger: true})
  render: () ->
    batee5 = @collection
    @$el.html @template({'collection': batee5})
    @

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
  	Backbone.history.navigate('final', {trigger: true})
  render: () ->
    implicants = @collection
    @$el.html @template({'collection': implicants})
    @

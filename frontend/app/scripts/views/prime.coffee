'use strict';

class Mccluskyfrontend.Views.Prime extends Backbone.View

  template: JST['app/scripts/templates/prime.ejs']

  tagName: 'div'

  id: ''

  className: ''

  events: {}

  initialize: () ->
    @listenTo @model, 'change', @render

  render: () ->
    @$el.html @template(@model.toJSON())

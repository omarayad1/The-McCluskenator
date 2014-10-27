'use strict';

Mccluskyfrontend.Views.Start = Backbone.View.extend(

  template: JST['app/scripts/templates/start.ejs']

  tagName: 'div'

  id: ''

  className: ''

  events: {}

  render: () ->
    @$el.html @template()
    @
)
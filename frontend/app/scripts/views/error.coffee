'use strict';

class Mccluskyfrontend.Views.Error extends Backbone.View

  template: JST['app/scripts/templates/error.ejs']

  tagName: 'div'

  id: ''

  className: ''

  events: {}

  render: () ->
    @$el.html @template()

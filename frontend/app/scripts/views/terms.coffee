'use strict';

class Mccluskyfrontend.Views.Terms extends Backbone.View

  template: JST['app/scripts/templates/terms.ejs']

  tagName: 'div'

  id: ''

  className: ''

  events: {
    'click button.terms-next'
  }
  
  render: () ->
    @$el.html @template()
    $('#terms').tagsInput()
    $('#cares').tagsInput()
    @
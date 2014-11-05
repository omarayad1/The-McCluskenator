'use strict';

class Mccluskyfrontend.Views.Terms extends Backbone.View

  template: JST['app/scripts/templates/terms.ejs']

  tagName: 'div'

  id: ''

  className: ''

  events: {
    'click button.terms-next': 'postTerms'
  }
  postTerms: ->
    $.post('/terms', {1:1, 2:3}, ->
        console.log "batee5"
      )
  render: () ->
    @$el.html @template()
    $('#terms').tagsInput()
    $('#cares').tagsInput()
    @
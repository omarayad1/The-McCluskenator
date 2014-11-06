'use strict';

class Mccluskyfrontend.Views.Terms extends Backbone.View

  template: JST['app/scripts/templates/terms.ejs']

  tagName: 'div'

  id: ''

  className: ''

  events: {
    'click a.terms-next': 'postTerms'
  }
  postTerms: ->
    minMax = $('.min-max-container input:checked').val()
    terms = $('#terms_tagsinput .tag span').text().split("  ")
    terms.splice(terms.length-1, 1)
    cares = $('#cares_tagsinput .tag span').text().split("  ")
    cares.splice(cares.length-1, 1)
    numberOfBits = $('.number-of-bits').val()
    $.ajax({url:'http://localhost:5000/terms', type:'POST', data:{'terms':terms, 'cares':cares, 'type': minMax, 'numberOfBits': numberOfBits}, success: (data)->
        table = []
        for term, value of data
          x = parseInt(term).toString(2)
          table.push(new Mccluskyfrontend.Models.Truthrow({'term':("00"+x).slice(-3), 'value': value}))
          window.Mccluskyfrontend.Data = new Mccluskyfrontend.Collections.Truthtable(table)
          window.location.href = 'http://localhost:9000/#/truth'
      })
  render: () ->
    @$el.html @template()
    $('#terms').tagsInput()
    $('#cares').tagsInput()
    @
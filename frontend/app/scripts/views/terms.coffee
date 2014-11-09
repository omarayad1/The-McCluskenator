'use strict';

class Mccluskyfrontend.Views.Terms extends Backbone.View

  template: JST['app/scripts/templates/terms.ejs']

  tagName: 'div'

  id: ''

  className: ''

  events: {
    'click a.terms-next': 'postTerms'
    'click a.skip-next': 'postSkip'
  }
  getPrime: ->
    $.ajax({
      url: 'http://localhost:5000/prime'
      type: 'GET'
      success: (data) ->
        primes = data.data
        primeTable = []
        for prime in primes
          primeTable.push(new Mccluskyfrontend.Models.Prime({'implicant': prime[0], 'origin': prime.slice(1,prime.length)}))
        console.log primeTable
        window.Mccluskyfrontend.PrimeImplicants = new Mccluskyfrontend.Collections.Primes(primeTable)
        window.location.href = 'http://localhost:9000/#/prime'
      })
  postTerms: ->
    minMax = $('.min-max-container input:checked').val()
    terms = $('#terms_tagsinput .tag span').text().split("  ")
    terms.splice(terms.length-1, 1)
    cares = $('#cares_tagsinput .tag span').text().split("  ")
    cares.splice(cares.length-1, 1)
    $.ajax({url:'http://localhost:5000/terms', type:'POST', data:{'terms':terms, 'cares':cares, 'type': minMax}, success: (data)->
        if not data.err
          delete data.err
          table = []
          for term, value of data
            x = parseInt(term).toString(2)
            table.push(new Mccluskyfrontend.Models.Truthrow({'term':("0000000000000000"+x).slice(parseInt(data['number-of-bits'])*-1), 'value': value}))
            window.Mccluskyfrontend.Data = new Mccluskyfrontend.Collections.Truthtable(table)
          window.location.href = 'http://localhost:9000/#/truth'
        else
          window.location.href = 'http://localhost:9000/#/error'

      })
  postSkip: ->
    minMax = $('.min-max-container input:checked').val()
    terms = $('#terms_tagsinput .tag span').text().split("  ")
    terms.splice(terms.length-1, 1)
    cares = $('#cares_tagsinput .tag span').text().split("  ")
    cares.splice(cares.length-1, 1)
    $.ajax({url:'http://localhost:5000/terms', type:'POST', data:{'terms':terms, 'cares':cares, 'type': minMax}, success: (data)->
        if not data.err
          $.ajax({
            url: 'http://localhost:5000/prime'
            type: 'GET'
            success: (data) ->
              primes = data.data
              primeTable = []
              for prime in primes
                primeTable.push(new Mccluskyfrontend.Models.Prime({'implicant': prime[0], 'origin': prime.slice(1,prime.length)}))
              console.log primeTable
              window.Mccluskyfrontend.PrimeImplicants = new Mccluskyfrontend.Collections.Primes(primeTable)
              window.location.href = 'http://localhost:9000/#/prime'
            })
        else
          window.location.href = 'http://localhost:9000/#/error'

      })
  render: () ->
    @$el.html @template()
    $('#terms').tagsInput()
    $('#cares').tagsInput()
    @
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
      url: 'http://mcclusky.herokuapp.com/prime'
      type: 'GET'
      success: (data) ->
        primes = data.data
        primeTable = []
        for prime in primes
          primeTable.push(new Mccluskyfrontend.Models.Prime({'implicant': prime[0], 'origin': prime.slice(1,prime.length)}))
        console.log primeTable
        window.Mccluskyfrontend.PrimeImplicants = new Mccluskyfrontend.Collections.Primes(primeTable)
        Backbone.history.navigate('prime', {trigger: true})
      })
  postTerms: ->
    minMax = $('.min-max-container input:checked').val()
    terms = $('#terms_tagsinput .tag span').text().split("  ")
    terms.splice(terms.length-1, 1)
    cares = $('#cares_tagsinput .tag span').text().split("  ")
    cares.splice(cares.length-1, 1)
    numberOfBits = $('.number-of-bits').val()
    $.ajax({url:'http://mcclusky.herokuapp.com/terms', type:'POST', data:{'terms':terms, 'cares':cares, 'type': minMax, 'numberOfBits': numberOfBits}, success: (data)->
        window.Mccluskyfrontend.Token = data.token
        if not data.table.err
          delete data.table.err
          table = []
          for term, value of data.table
            x = parseInt(term).toString(2)
            table.push(new Mccluskyfrontend.Models.Truthrow({'term':("0000000000000000"+x).slice(parseInt(data['number-of-bits'])*-1), 'value': value}))
            window.Mccluskyfrontend.Data = new Mccluskyfrontend.Collections.Truthtable(table)
          Backbone.history.navigate('truth', {trigger: true})
        else
          Backbone.history.navigate('error', {trigger: true})

      })
  postSkip: ->
    minMax = $('.min-max-container input:checked').val()
    terms = $('#terms_tagsinput .tag span').text().split("  ")
    terms.splice(terms.length-1, 1)
    cares = $('#cares_tagsinput .tag span').text().split("  ")
    cares.splice(cares.length-1, 1)
    numberOfBits = $('.number-of-bits').val()
    $.ajax({url:'http://mcclusky.herokuapp.com/terms', type:'POST', data:{'terms':terms, 'cares':cares, 'type': minMax, 'numberOfBits': numberOfBits}, success: (data)->
        if not data.table.err
          window.Mccluskyfrontend.Token = data.token
          $.ajax({
            url: 'http://mcclusky.herokuapp.com/prime'
            type: 'POST'
            data: {token: Mccluskyfrontend.Token}
            success: (data) ->
              primes = data.data
              primeTable = []
              for prime in primes
                primeTable.push(new Mccluskyfrontend.Models.Prime({'implicant': prime[0], 'origin': prime.slice(1,prime.length)}))
              console.log primeTable
              window.Mccluskyfrontend.PrimeImplicants = new Mccluskyfrontend.Collections.Primes(primeTable)
              Backbone.history.navigate('prime', {trigger: true})
            })
        else
          Backbone.history.navigate('error', {trigger: true})

      })
  render: () ->
    @$el.html @template()
    $('#terms').tagsInput()
    $('#cares').tagsInput()
    @

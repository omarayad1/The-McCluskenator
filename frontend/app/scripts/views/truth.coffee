'use strict';

class Mccluskyfrontend.Views.Truth extends Backbone.View

  template: JST['app/scripts/templates/truth.ejs']

  tagName: 'div'

  id: ''

  className: ''

  events: {
    'click a.truth-next': 'getPrime'
  }
  getPrime: ->
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

  render: () ->
    table = @collection
    @$el.html @template({'collection': table})
    @

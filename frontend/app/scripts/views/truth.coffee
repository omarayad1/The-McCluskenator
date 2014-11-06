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
  		url: 'http://localhost:5000/prime'
  		type: 'GET'
  		success: (data) ->
  			console.log(data.data)
  			primes = data.data
  			primeTable = []
  			for prime in primes
  				console.log(prime)
  				primeTable.push(new Mccluskyfrontend.Models.Prime({'implicant': prime}))
  			Mccluskyfrontend.PrimeImplicants = new Mccluskyfrontend.Collections.Primes(primeTable)
  			console.log(Mccluskyfrontend.PrimeImplicants)
  			window.location.href = 'http://localhost:9000/#/primeFiltered'
  		})

  render: () ->
    table = @collection
    @$el.html @template({'collection': table})
    @

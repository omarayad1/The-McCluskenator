'use strict';

class Mccluskyfrontend.Views.Prime extends Backbone.View

	template: JST['app/scripts/templates/prime.ejs']

	tagName: 'div'

	id: ''

	className: ''

	events: {
		'click a.prime-next': 'getEssential'
	}
	getEssential: ->
		$.ajax({
			url: 'http://localhost:5000/essential'
			type: 'GET'
			success: (data) ->
				table = []
				for implicant in data.data
					table.push(new Mccluskyfrontend.Models.Essential({'term': implicant[0], 'origin':implicant[1]}))
				window.Mccluskyfrontend.PrimeEssential = new Mccluskyfrontend.Collections.Essential(table)
				window.location.href = 'http://localhost:9000/#/essential'
			})
	render: () ->
		implicants = @collection
		@$el.html @template({'collection': implicants})
		@

'use strict';

class Mccluskyfrontend.Views.Essential extends Backbone.View

	template: JST['app/scripts/templates/essential.ejs']

	tagName: 'div'

	id: ''

	className: ''

	events: {
		'click a.essential-next': 'getDominating'
	}

	getDominating: ->
		$.ajax({
			url: 'http://localhost:5000/dominating'
			type: 'GET'
			success: (data) ->
				final = data.data
				terms = []
				for term in final
					terms.push(new Mccluskyfrontend.Models.Dominating({'term': term}))
				Mccluskyfrontend.PrimeDominate = new Mccluskyfrontend.Collections.Dominating(terms)
				window.location.href='http://localhost:9000/#/dominating'
			})
	render: () ->
		batee5 = @collection
		@$el.html @template({'collection': batee5})
		@

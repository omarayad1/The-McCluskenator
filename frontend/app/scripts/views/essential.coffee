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
			url: 'http://mcclusky.herokuapp.com/dominating'
			type: 'POST'
			data: {token: Mccluskyfrontend.Token}
			success: (data) ->
				final = data.data
				terms = []
				for term in final
					terms.push(new Mccluskyfrontend.Models.Dominating({'term': term}))
				Mccluskyfrontend.PrimeDominate = new Mccluskyfrontend.Collections.Dominating(terms)
				Backbone.history.navigate('dominating', {trigger: true})
			})
	render: () ->
		batee5 = @collection
		@$el.html @template({'collection': batee5})
		@

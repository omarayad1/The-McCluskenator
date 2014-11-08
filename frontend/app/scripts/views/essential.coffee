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
			type: 'POST'
			success: (data) ->
				console.log data
				window.location.href='http://localhost:9000/#/dominating'
			})
	render: () ->
		batee5 = @collection
		@$el.html @template({'collection': batee5})
		@

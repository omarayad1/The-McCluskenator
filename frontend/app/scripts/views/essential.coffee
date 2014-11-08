'use strict';

class Mccluskyfrontend.Views.Essential extends Backbone.View

	template: JST['app/scripts/templates/essential.ejs']

	tagName: 'div'

	id: ''

	className: ''

	events: {}

	render: () ->
		batee5 = @collection
		@$el.html @template({'collection': batee5})
		@

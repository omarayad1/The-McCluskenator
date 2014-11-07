'use strict';

Mccluskyfrontend.Routers.Main = Backbone.Router.extend(
	routes:
		'': 'start'
		'start': 'start'
		'terms': 'terms'
		'truth': 'truth'
		'prime': 'prime'
	)

router = new Mccluskyfrontend.Routers.Main()

router.on 'route:start', ->
	view = new Mccluskyfrontend.Views.Start
	view.setElement '.backbone-container'
	view.render()

router.on 'route:terms', ->
	view = new Mccluskyfrontend.Views.Terms
	view.setElement '.backbone-container'
	view.render()

router.on 'route:truth', ->
	view = new Mccluskyfrontend.Views.Truth({'collection': Mccluskyfrontend.Data.toJSON()})
	view.setElement '.backbone-container'
	view.render()

router.on 'route:prime', ->
	view = new Mccluskyfrontend.Views.Prime({'collection': Mccluskyfrontend.PrimeImplicants.toJSON()})
	view.setElement '.backbone-container'
	view.render()
'use strict';

Mccluskyfrontend.Routers.Main = Backbone.Router.extend(
	routes:
		'': 'start'
		'start': 'start'
		'terms': 'terms'
		'truth': 'truth'
		'prime': 'prime'
		'essential': 'essential'
		'dominating': 'dominating'
		'final': 'final'
		'circuit': 'circuit'
		'error': 'error'
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

router.on 'route:essential', ->
	view = new Mccluskyfrontend.Views.Essential({'collection': Mccluskyfrontend.PrimeEssential.toJSON()})
	view.setElement '.backbone-container'
	view.render()

router.on 'route:dominating', ->
	view = new Mccluskyfrontend.Views.Dominating({'collection': Mccluskyfrontend.PrimeDominate.toJSON()})
	view.setElement '.backbone-container'
	view.render()

router.on 'route:final', ->
	view = new Mccluskyfrontend.Views.Final({'collection': Mccluskyfrontend.PrimeDominate.toJSON()})
	view.setElement '.backbone-container'
	view.render()

router.on 'route:circuit', ->
	view = new Mccluskyfrontend.Views.Circuit({'collection': Mccluskyfrontend.PrimeDominate.toJSON()})
	view.setElement '.backbone-container'
	view.render()

router.on 'route:error', ->
	view = new Mccluskyfrontend.Views.Error
	view.setElement '.backbone-container'
	view.render()
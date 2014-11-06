'use strict';

class Mccluskyfrontend.Models.Truthrow extends Backbone.Model
  url: '',

  initialize: () ->

  defaults: {
  	'term': 1
  	'value': null
  }

  validate: (attrs, options) ->

  parse: (response, options) ->
    response

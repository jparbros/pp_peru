# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->

	$('#news_actor_tokens').tokenInput '/admin/news_actors.json'
		theme: 'facebook'
		prePopulate: $('#news_actor_tokens').data('load')
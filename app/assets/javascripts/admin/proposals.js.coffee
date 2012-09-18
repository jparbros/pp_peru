# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->

	$('#proposal_topic_tokens').tokenInput '/admin/topics.json'
		theme: 'facebook'
		prePopulate: $('#proposal_topic_tokens').data('load')
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->

	$('#discussion_topic_tokens').tokenInput '/admin/discussions/topics.json'
		theme: 'facebook'
		prePopulate: $('#discussion_topic_tokens').data('load')

	$('.discussion_end').datepicker
		format: 'dd/mm/yyyy'
		autoclose: true
		language: 'es'
	
	$('.discussion_end').on 'changeDate', (ev)->
		time_now = new Date()
		if ev.date.valueOf() < time_now.valueOf()
			$("#alert").removeClass('hidden')
		else
			$("#alert").addClass('hidden')
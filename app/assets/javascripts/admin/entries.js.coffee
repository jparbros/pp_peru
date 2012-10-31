# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->

	$('#entry_topic_tokens').tokenInput '/admin/topics.json'
		theme: 'facebook'
		prePopulate: $('#entry_topic_tokens').data('load')
    
  $('#entry_visibility').change ->
    if $(@).val() == 'group'
      $('#group-tokens').show()
      
  if $('#entry_visibility').val() == 'group'
    $('#group-tokens').show()
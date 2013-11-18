# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#news_topic_tokens').tokenInput '/admin/topics.json',
    theme: 'facebook',
    prePopulate: $('#news_topic_tokens').data('load')

	$('#news_actor_tokens').tokenInput '/admin/news_actors.json',
		theme: 'facebook',
		prePopulate: $('#news_actor_tokens').data('load')

	$('#news_group_tokens').tokenInput '/admin/groups.json',
		theme: 'facebook',
		prePopulate: $('#news_group_tokens').data('load')

	$('#news_visibility').change ->
		if $(@).val() == 'group'
			$('#group-tokens').show()
		else
			$('#group-tokens').hide()
      
		if $(@).val() == 'public'
			$('#facebook-comment').show()
		else
			$('#facebook-comment').hide()

	if $('#news_visibility').val() == 'group'
		$('#group-tokens').show()
	if $('#news_visibility').val() == 'public'
		$('#facebook-comment').show()
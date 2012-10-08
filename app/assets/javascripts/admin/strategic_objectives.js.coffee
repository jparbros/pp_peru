# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$("[name='date_objective']").live
		'blur': -> 
			$(@).datepicker('hide')
			$('.form_in_place').submit()
			
	$('.best_in_place').best_in_place()
	
	$('.date_objective').live
		'focus': ->
			$(@).datepicker
				format: 'yyyy-mm-dd'
				autoclose: true
				language: 'es'
	
	$('.objective_news').click ->
		form_id = $(@).attr('id')
		$(@).addClass('hide')
		$("#edit_strategic_objective_#{form_id}").removeClass('hide')
		if $("#edit_strategic_objective_#{form_id} > .token-input-list-facebook").size() < 1 
			$("#edit_strategic_objective_#{form_id} > input").tokenInput '/admin/news.json'
				theme: 'facebook'
				noResultsText: 'No se encontro'
				propertyToSearch: 'title'
				prePopulate: $("#edit_strategic_objective_#{form_id} > input").data('load')
	
		$("#edit_strategic_objective_#{form_id} > .token-input-list-facebook").focusout ->
			$(@).parent().submit()
		
		
	

		
		
	
	
#	$("[name='paper_tokens']").live
#		'focus': ->
#			$(@).tokenInput '/admin/news.json'
#				theme: 'facebook'
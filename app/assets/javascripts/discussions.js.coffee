# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$("#show_annotation").click ->
		$(@).parent().find('.comment_content').toggleClass('hidden')
		$(@).find('.btn').button('reset')
	
	$("#show_annotation").toggle ->
		$(@).find('.btn').text("Ocular")
	, ->
		$(@).find('.btn').text("Mostrar")
	
	$('.review_admin_link').tooltip()

		
		
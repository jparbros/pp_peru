# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	provinces = $('#user_province_id').html()
	$('#user_state_id').change ->
		state = $('#user_state_id :selected').text()
		options = $(provinces).filter("optgroup[label='#{state}']").html()
		if options
			$('#user_province_id').html(options)
		else
			$('#user_province_id').empty()
		$('#user_province_id').change()
	
	districts = $('#user_district_id').html()
	$('#user_province_id').live 
		'change': ->
			province = $('#user_province_id :selected').text()
			options = $(districts).filter("optgroup[label='#{province}']").html()
			if options
				$('#user_district_id').html(options)
			else
				$('#user_district_id').empty()
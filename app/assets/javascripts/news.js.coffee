# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#Options for Jrating  http://www.myjqueryplugins.com/jRating
jQuery ->
	$(".rate_news").jRating
		bigStarsPath: '../assets/stars.png'
		phpPath: '/news/rates'
		rateMax: 5
		step: false
		decimalLength: 0
		showRateInfo: true
		onSuccess: (respond)->
			$(".alert").removeClass('hidden')
			$(".alert span").text(respond.notice)
			
	$('.rate_actor').jRating
		smallStarsPath: '../assets/small.png'
		phpPath: '/news_actors/rates'
		rateMax: 5
		decimalLength: 0
		showRateInfo: true
		type: 'small'
		onSuccess: (respond)->
			$(".alert").removeClass('hidden')
			$(".alert span").text(respond.notice)
		
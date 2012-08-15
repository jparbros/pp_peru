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
		decimalLength: 2
		showRateInfo: true
		onSuccess: ->
			#alert 'fuck yeah'
			
	$('.rate_actor').jRating
		smallStarsPath: '../assets/small.png'
		phpPath: '/news_actors/rates'
		rateMax: 5
		decimalLength: 2
		showRateInfo: true
		type: 'small'
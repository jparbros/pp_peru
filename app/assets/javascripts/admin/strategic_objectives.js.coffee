# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $("body").on blur: -> 
    $(@).datepicker('hide')
    $('.form_in_place').submit()
  , "[name='date_objective']"
      
  $('.best_in_place').best_in_place()
  
  $('body').on focus: ->
    $(@).datepicker
      format: 'yyyy-mm-dd'
      autoclose: true
      language: 'es'
  ,'.date_objective'
  
  $('#attendee_birthday').datepicker
    format: 'yyyy-mm-dd'
    autoclose: true
    language: 'es'
  
  $('.objective_news').click ->
    form_id = $(@).attr('id')
    $(@).addClass('hide')
    $("#form_objective_news_#{form_id}").removeClass('hide')
    if $("#form_objective_news_#{form_id} > .token-input-list-facebook").size() < 1 
      $("#form_objective_news_#{form_id} > input").tokenInput '/admin/news.json',
        theme: 'facebook',
        noResultsText: 'No se encontro',
        propertyToSearch: 'title',
        prePopulate: $("#form_objective_news_#{form_id} > input").data('load')
    
    $("#form_objective_news_#{form_id} > .token-input-list-facebook").focusout ->
      $(@).parent().submit()
    
  $('.objective_attendees').click ->
    form_id = $(@).attr('id')
    $(@).addClass('hide')
    $("#form_objective_attendee_#{form_id}").removeClass('hide')
    if $("#form_objective_attendee_#{form_id} > .token-input-list-facebook").size() < 1 
      $("#form_objective_attendee_#{form_id} > input").tokenInput '/admin/attendees.json',
        theme: 'facebook',
        noResultsText: 'No Se encontro, Puede Ingresar Un Participante',
        prePopulate: $("#form_objective_attendee_#{form_id} > input").data('load')

    $("#form_objective_attendee_#{form_id} > .token-input-list-facebook").focusout ->
      $(@).parent().submit()
  
  $('.add_attendee').click ->
    $('#attended-modal').modal()
  
  $('.nav-tabs').button()

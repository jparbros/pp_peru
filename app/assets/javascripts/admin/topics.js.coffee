# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#tree').tree
    autoOpen: true,
    autoEscape: false

  $("#tree").bind "tree.click", (event) ->
    node = event.node
    console.log node
    alert node.name
    
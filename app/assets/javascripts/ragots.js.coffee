# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("form").bind "ajax:success", (event,data) =>
    $("ul#ragots_list").prepend "<li>" + data.content + " - " + data.date + "</li>"



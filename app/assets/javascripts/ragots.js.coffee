# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

focus_ragot = (event)  =>
  c = String.fromCharCode event.which
  if /[_-a-zA-Z0-9]/.test(c) or event.type == "click"
    if $("textarea").val() == "Nouveau Ragot"
      $("textarea").val ""
    $("textarea").focus()

$ ->
  $(document).bind "keydown", focus_ragot

  $("textarea").bind "click", focus_ragot
  $("textarea").bind "focus", ()  =>
    $(document).unbind "keydown"

  $("textarea").bind "focusout", ()  =>
    $(document).bind "keydown", focus_ragot
    if $("textarea").val() == ""
      $("textarea").val("Nouveau Ragot")

  $("form").bind "ajax:success", (event,data) =>
    $("ul#ragots_list").prepend "<li>" + data.content + " - " + data.date + "</li>"



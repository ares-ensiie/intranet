# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
#= require bootstrap/load-image.min
#= require bootstrap/image-gallery.min
#= require jquery-fileupload
#

toggleDropping = (event) =>
  $(this).toggleClass "dropping"
  if event.type == "dragenter"
    $("#droparea p").text "Déposez"
  else if event.type == "dragleave"
    $("#droparea p").text "Glissez-déposez vos fichiers"
  event.preventDefault()
  false

$ ->
  $("#album_fileinput").fileupload {
    dataType: 'json',
    done: (e,data) =>
      $.each data.result, (index, file) =>
        $('<p/>').text(file.name).appendTo document.body
  }

  #  $("#droparea").bind "dragleave", toggleDropping
  #  $("#droparea").bind "dragenter", toggleDropping
  #  $("#droparea").bind "drop", (event) =>
  #    $("#droparea p").text(event.dataTransfer.files.length + " photos à uploader")
  #    event.preventDefault()
  #    event.stopPropagation()
  #    false
  #  true

  




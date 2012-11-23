# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
#= require bootstrap/load-image.min
#= require bootstrap/image-gallery.min
#= require jquery-fileupload
#

$ ->
  $("#album_fileinput").fileupload {
    dataType: 'json',
    done: (e,data) =>
      $.each data.result, (index, file) =>
        $('<p/>').text(file.name).appendTo document.body
  }



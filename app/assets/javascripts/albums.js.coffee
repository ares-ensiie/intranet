# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
#= require bootstrap/load-image.min
#= require bootstrap/image-gallery.min
#= require jquery-fileupload
#


basename = (path) ->
  path.replace( /.*\//, "").replace( /\..*/, "")

$ ->
  $("#album_fileinput").fileupload {
    dataType: 'json',
    done: (e,data) =>
      $.each data.result, (index, file) =>
        $('<p/>').text(file.name).appendTo document.body
  }

  $("span.edit-img :last-child").bind "click", (event) ->
    $(this).toggleClass "edit-thumb-mask"

  $("form").bind "submit", (event) ->
    form = $(this)
    imgs = $("span.edit-img :first-child")
    i = 0
    $("span.edit-img :last-child").each (index) ->
      if $(this).hasClass "edit-thumb-mask"
         form.append "<input type=\"hidden\" name=\"imgs-to-delete["+i+"]\" value=\"" + basename(imgs[index].getAttribute("src"))+"\"/>"
         i++


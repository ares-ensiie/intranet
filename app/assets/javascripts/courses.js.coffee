#= require_self

refresh_matters = (elem) ->
  $("#courses_document_matters").children().remove()
  year = $(elem).val()
  $.each matters, (index,value) ->
    if value[1] == year
      $("#courses_document_matters").append "<option value=\"" + value[0] + "\">" + value[0] + "</option>"

$ ->
  refresh_matters $("#document_matter_year")
  $("#document_matter_year").change (event) ->
    $("#courses_document_matter").val("")
    refresh_matters(this)

  $("#new_courses_document").submit (event) ->
    if $("#courses_document_matter").val().length == 0
      matter = "empty"
    else
      matter = $("#courses_document_matter").val()
    $(this).attr("action", "/courses/" + matter + "/")


#= require_self

refresh_matters = (elem) ->
  year_matters = []
  year = $(elem).val()
  $.each matters, (index,value) ->
    if value[1] == year
      year_matters = year_matters.concat value[0]
  year_matters

@courses_setup_completion = () ->
  selectedMatters

  if window.hasOwnProperty("matter")
    $("#document_matter_year").val window.matter[1]
    $("#courses_document_matter_id").val window.matter[0]

  $("#courses_document_matter_id").select2 {
    tags: ->
      selectedMatters
    maximumSelectionSize: 1
  }

  selectedMatters = refresh_matters $("#document_matter_year")
  $("#document_matter_year").change (event) ->
    $("#courses_document_matter_id").select2("val", [])
    selectedMatters = refresh_matters(this)


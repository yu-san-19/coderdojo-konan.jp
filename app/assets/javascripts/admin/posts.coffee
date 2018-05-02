# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('body').layout 'fix'
  return

init_datetimepciker = ->
  (->
    $(".form_datetime").datetimepicker
      format: "YYYY/MM/DD HH:mm"
      sideBySide: true
  )

$(document).ready ->
  init_datetimepciker()

$(document).on "ready turbolinks:load", init_datetimepciker()
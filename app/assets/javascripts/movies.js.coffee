# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $("#movies#index").on("ajax:success", (e, data, status, xhr) ->
    $("#movies#index").append xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#movies#index").append "<p>ERROR</p>"
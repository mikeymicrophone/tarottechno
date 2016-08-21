# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('.in_line_place input').click ->
    $.ajax '/places/' + $(this).data('place_id'),
      'type': 'put'
      'data':
        'place':
          'complete': $(this).val()

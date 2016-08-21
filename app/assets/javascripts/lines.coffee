# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('.in_line_place input').on 'change', ->
    $.ajax
      'url': '/places/' + $(this).data('place_id')
      'type': 'put'
      'dataType': 'script'
      'data':
        'place':
          'complete': $(this).prop('checked')
      'success': ->
        alert('bingo')

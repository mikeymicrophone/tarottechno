# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('#set_to_private').on 'change', ->
    if ($(this).prop('checked'))
      $.ajax
        url: '/readings/' + $(this).data('reading_id') + '/make_private'
        type: 'put'
        dataType: 'script'
    else
      $.ajax
        url: '/readings/' + $(this).data('reading_id') + '/not_private'
        type: 'put'
        dataType: 'script'

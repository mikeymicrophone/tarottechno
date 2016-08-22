$(document).on 'turbolinks:load', ->
  $('#join_mail_list').click ->
    $.ajax '/add_me_to_mail_list',
      data:
        email: $('#mail_list_email_address').val()
      type: 'POST'

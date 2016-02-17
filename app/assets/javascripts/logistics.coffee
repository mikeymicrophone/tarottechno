$(document).bind 'page:update', ->
  console.log("The page load handler fired.")
  $('#join_mail_list').click ->
    console.log("The click handler fired.")
    $.ajax '/add_me_to_mail_list',
      data:
        email: $('#mail_list_email_address').val()
      type: 'POST'

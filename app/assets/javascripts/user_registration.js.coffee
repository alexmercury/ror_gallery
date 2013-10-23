$(document).ready ->

  $(document).on 'click', '#pass', ->
    if $('#user_password').length <= 0
      $('#pass_form').append '<div><input id="user_password" name="user[password]" size="30" type="password" autocomplete="off" placeholder="'+(i18n.user_profile_edit.new_password_placeholder)+'"></div>'
      $('#pass_form').append '<div><input id="user_password_confirmation" name="user[password_confirmation]" size="30" type="password" placeholder="'+(i18n.user_profile_edit.new_password_confirmation_placeholder)+'"></div>'
    else
      $('#user_password').remove()
      $('#user_password_confirmation').remove()
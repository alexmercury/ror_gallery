#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require jquery.easing.1.3
#= require jquery.roundabout.min
#= require pictures
#= require likes
#= require pusher
#= require pusher/pusher_rails
#= require comments
#= require categories

Date::toUTCFormat = (format) ->
  f =
    y: @getYear() + 1900
    m: @getUTCMonth() + 1
    d: @getUTCDate()
    H: @getUTCHours()
    M: @getUTCMinutes()
    S: @getUTCSeconds()

  for k of f
    format = format.replace('%' + k, (if f[k] < 10 then '0' + f[k] else f[k]))
  format
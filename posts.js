# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready( function () {
  var count = 1000;
  $(".countdown").text(count);
  var countdown = setInterval( function () {
    $(".countdown").text(count);
    count += 1;
  },1000);
});

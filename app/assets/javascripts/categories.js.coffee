# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$(".show-details").click ->
    $element = $(this).closest("li").find(".description")
    if $element.hasClass("hide")
      $element.removeClass('hide')
    else
      $element.addClass('hide')
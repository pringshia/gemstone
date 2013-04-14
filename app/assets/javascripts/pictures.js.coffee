# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$('.thumb').click ->
		index = $(this).attr('data-index');
		$('.picture_option').hide()
		selector = ".picture_option[data-index="+index+"]"
		$(selector).show()
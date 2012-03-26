# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	$('.hour_details .detail_link').each ->
		$(this).click ->
			$(this).next().slideToggle() 	

	$("#projects_search input").keyup ->
	  $.get $("#projects_search").attr("action"), $("#projects_search").serialize(), null, "script"
	  false
  
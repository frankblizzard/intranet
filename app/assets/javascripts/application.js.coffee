###
 This is a manifest file that'll be compiled into including all the files listed below
 Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
 be included in the compiled file accessible from http://example.com/assets/application.js
 It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
 the compiled file.
###
//= require jquery
//= require jquery-ui
//= require autocomplete-rails
//= require facebox
//= require nested_form
//= require jquery_ujs
//= require_tree .


optimiseContentSize = ->
	fit_w = $(window).width() - 260
	fit_h = $(window).height() - 20
	$('#content').width(fit_w)
	$('#content').height(fit_h)


toggleLoading = ->
	$('#loading').toggle()
	console.log("toggle")




loadMoreResults = -> 
  current_page++
  $.ajax {
		url : '/posts.js?page=' + current_page,
		method: 'GET',
		beforeSend: ->
			$("#load_more_image").show()
			$("#load_more .button").hide()
		complete: ->
			$("#load_more_image").hide()
			$("#load_more .button").show()
	}

current_page = 1
	
jQuery ->

	optimiseContentSize()
	$('a[rel*=facebox]').facebox()
	$('a[title!=""]').tipTip()
	
	# bind loading toggle to any form submitted by ajax
	$("form").bind("ajax:before", toggleLoading).bind("ajax:complete", toggleLoading)
	
	$('#more_results').bind('click', loadMoreResults)

	$(window).bind('resize', optimiseContentSize)
	$('.content_window .header a').each ->
			$(this).click ->
					$(this).parent().parent().find('.inner').slideToggle()
					if $(this).hasClass('open')
						$(this).removeClass('open')
						$(this).addClass('closed')
						$(this).parent().parent().find('.edit_links').hide()
					else 
						$(this).removeClass('closed')
						$(this).addClass('open')
						$(this).parent().parent().find('.edit_links').show()

					
		
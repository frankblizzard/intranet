# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#calendar table td').each ->
    $(this).click ->
      $('#calendar table td.active').removeClass('active')
      $(this).addClass('active')
      date = $(this).find('.calendar_date').attr('data-date')
      $('#new_hour #hour_date').val(date)

  $('#hour_project_name').autocomplete
    source: ['foo', 'fool', 'foobar']
	
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

updateTasksField = (name, html) ->
  $('#hour_task_id').hide()
  options = $(html).filter("optgroup[label='" + name + "']").html()
  if options
	  $('#hour_task_id').html(options)
	  $('#hour_task_id').show()
  else
    $('#hour_task_id').empty()
    $('#hour_task_id').hide()


jQuery ->
  $('#hour_task_id').hide()
  tasks = $('#hour_task_id').html()
  $('#fake_project').bind 'railsAutocomplete.select', (event, data) ->
    updateTasksField(data.item.value, tasks)
	
  $('#calendar table td').each ->
    $(this).click ->
      $('#calendar table td.active').removeClass('active')
      $(this).addClass('active')
      date = $(this).find('.calendar_date').attr('data-date')
      $('#new_hour #hour_date').val(date)
			
  $('ul.stunden li.title').tipTip()

  $('ul.stunden li.extra, ul.stunden li.regular, ul.stunden li.holiday, .stunden .ill').each ->
	  $(this).click ->
      $('ul.stunden li.active').removeClass('active')
      $(this).addClass('active')
      $.get '/hours/'+$(this).attr('data-hour-id')+'.js', { hour: $(this).attr('data-hour-id') }
      updateTasksField($('#fake_project').text(), $('#hour_task_id').html()) 
			  


		
	
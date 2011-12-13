# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

tasks = null

updateTasksField = (name, html) ->
  $('#hour_task_id').hide()
  $('.tasks_hour_fields').show()
  options = $(html).filter("optgroup[label='" + name + "']").html()
  if options
	  $('#hour_task_id').html(options)
	  $('#hour_task_id').show()
  else
    $('#hour_task_id').empty()
    $('#hour_task_id').hide()


reinitTasks = ->
  $('#hour_task_id').hide()
  $('#fake_project').bind 'railsAutocomplete.select', (event, data) ->
      updateTasksField(data.item.value, tasks)



jQuery ->
  $('#hour_task_id').hide()
  tasks = $('#hour_task_id').html()
  $('#fake_project').bind 'railsAutocomplete.select', (event, data) ->
      updateTasksField(data.item.value, tasks)
  $('ul.stunden li.extra, ul.stunden li.regular, ul.stunden li.holiday, .stunden .ill').each ->
    $(this).click ->
      $('ul.stunden li.active').removeClass('active')
      $(this).addClass('active')
      $.ajax
        url: "/hours/" + $(this).attr("data-hour-id") + ".js"
        method: "GET"
        data:
          hour: $(this).attr("data-hour-id")
        success: (data) ->
          name = $("#fake_project").val()
          updateTasksField(name, tasks)
      
	
  $('#calendar table td').each ->
    $(this).click ->
      $('#calendar table td.active').removeClass('active')
      $(this).addClass('active')
      $('.tasks_hour_fields').hide()
      date = $(this).find('.calendar_date').attr('data-date')
      $('#new_hour #hour_date').val(date)
      if $(this).find('li.extra, li.regular, li.holiday, li.ill').length == 0
        setTimeout(reinitTasks, 200)
  $('ul.stunden li.title').tipTip()

  


		
	
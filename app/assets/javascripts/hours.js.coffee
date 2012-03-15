# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

tasks = null
task_clicked = 0

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

uncheckAll = ->
  $("#new_hour input[type=checkbox]").attr "checked", false



jQuery ->
  $('#hour_task_id').hide()
  $('.show_tasks select').show()
  tasks = $('#hour_task_id').html()
  $('#fake_project').bind 'railsAutocomplete.select', (event, data) ->
      updateTasksField(data.item.value, tasks)
  $("#hour_user_id").change ->
	  window.location.replace "/hours?user_id=" + $(this).val() #+ "&view_mode=<%= params[:view_mode] %>"
  $("#month_date_2i").change ->
 	  window.location.replace "/hours?month=" + $("#month_date_1i").val() + "-" + $("#month_date_2i").val() + "-01"
  $('ul.stunden li.extra, ul.stunden li.regular, ul.stunden li.holiday, .stunden .ill').each ->
    $(this).click ->
      task_clicked = $(this).attr("data-task-id")
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
          if task_clicked != undefined
            $("#hour_task_id option[value$='" + task_clicked + "']").attr('selected', true)
					
      
	
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

  $("#hour_holiday").click ->
    if $(this).is(":checked")
      if confirm("Make this day holiday (your input might be overwritten) ?")
        uncheckAll()
        $("#hour_holiday").attr "checked", true
        $("#hour_amount").val "8"
        $("#fake_project").val "00 - Absence"
        $("#real_project_id").val "189"
        $("#hour_task_id").val "72"
        $('.show_tasks select').show()
        $("#hour_description").val "Holiday"
        $("#hour_work_category_id option").eq(7).attr "selected", "selected"

  $("#hour_ill").click ->
    if $(this).is(":checked")
      if confirm("Were you ill this day? (your input might be overwritten) ?")
        uncheckAll()
        $("#hour_ill").attr "checked", true
        $("#hour_amount").val "8"
        $("#fake_project").val "00 - Absence"
        $("#real_project_id").val "189"
        $("#hour_task_id").val "73"
        $('.show_tasks select').show()
        $("#hour_description").val "Krank"
        $("#hour_work_category_id option").eq(7).attr "selected", "selected"

  $("#hour_comp_time").click ->
    if $(this).is(":checked")
      if confirm("Was this day comp time (Überstunden Abbau) ? (your input might be overwritten) ?")
        uncheckAll()
        $("#hour_comp_time").attr "checked", true
        $("#hour_amount").val "8"
        $("#fake_project").val "00 - Absence"
        $("#real_project_id").val "189"
        $("#hour_task_id").val "72"
        $('.show_tasks select').show()
        $("#hour_description").val "Comp Time (FZA)"
        $("#hour_work_category_id option").eq(7).attr "selected", "selected"

	 $("#hour_public_holiday").click ->
	   if $(this).is(":checked")
	     if confirm("Was this day public holiday (Feiertag) ? (your input might be overwritten) ?")
	       uncheckAll()
	       $("#hour_public_holiday").attr "checked", true
	       $("#hour_amount").val "8"
	       $("#fake_project").val "00 - Absence"
	       $("#real_project_id").val "189"
	       $("#hour_task_id").val "72"
	       $('.show_tasks select').show()
	       $("#hour_description").val "Public Holiday / Feiertag"
	       $("#hour_work_category_id option").eq(7).attr "selected", "selected"
   
   
   

		
	
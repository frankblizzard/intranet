# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/



showPreview = (coords) ->
  rx = 350 / coords.w
  ry = 350 / coords.h
  $("#jc_comment_x1").val coords.x
  $("#jc_comment_y1").val coords.y
  $("#jc_comment_x2").val coords.x2
  $("#jc_comment_y2").val coords.y2
  $("#jc_comment_w").val coords.w
  $("#jc_comment_h").val coords.h
  $("#preview").css
    width: Math.round(rx * $('#review_image').width()) + "px"
    height: Math.round(ry *$('#review_image').height()) + "px"
    marginLeft: "-" + Math.round(rx * coords.x) + "px"
    marginTop: "-" + Math.round(ry * coords.y) + "px"


prepareFeedback = () ->
	$('.jcrop-tracker').attr('id', 'test')
	$('#comments .feedback').each ->
    fb = $(this).detach()
    $('.jcrop-tracker').after(fb)

    


jQuery ->
  $("#review_image").Jcrop
    onChange: showPreview
    onSelect: showPreview
    aspectRatio: 1
  , ->
    prepareFeedback()



# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jc_height = 0
jc_width = 0
preview_height = 0
preview_width = 0

showPreview = (coords) ->
  rx = preview_width / coords.w
  ry = preview_height / coords.h
  $("#x").val coords.x
  $("#y").val coords.y
  $("#x2").val coords.x2
  $("#y2").val coords.y2
  $("#w").val coords.w
  $("#h").val coords.h
  $("#preview").css
    width: Math.round(rx * jc_width) + "px"
    height: Math.round(ry *jc_height) + "px"
    marginLeft: "-" + Math.round(rx * coords.x) + "px"
    marginTop: "-" + Math.round(ry * coords.y) + "px"

jQuery ->
  jc_height = $('#review_image').height()
  jc_width = $('#review_image').width()
  preview_height = $('.preview_window:first').height()
  preview_width = $('.preview_window:first').width()
  console.log(jc_height)
  console.log(jc_width)
  console.log(preview_height)
  console.log(preview_width)
  $("#review_image").Jcrop
    onChange: showPreview
    onSelect: showPreview
    aspectRatio: 1

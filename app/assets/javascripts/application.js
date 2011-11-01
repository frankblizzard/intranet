// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function optimiseContentSize () {
	var fit_w = $(window).width() - 260;
	var fit_h = $(window).height() - 20;
	$('#content').width(fit_w);
	$('#content').height(fit_h);
}

$(document).ready(function () {

	optimiseContentSize();
	$(window).bind('resize', optimiseContentSize);
	$('.content_window .header a').each(function () {
			$(this).click(function () {
					$(this).parent().parent().find('.inner').slideToggle();
					if ($(this).hasClass('open')) {
						$(this).removeClass('open');
						$(this).addClass('closed');
					} else {
						$(this).removeClass('closed');
						$(this).addClass('open');

					}
				});
		});
					
	});
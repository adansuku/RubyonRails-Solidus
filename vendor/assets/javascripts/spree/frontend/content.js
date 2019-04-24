$(document).ready(function(){
	offset = $('#header').height();
	$('#content').css('margin-top', offset  + 1);
	$('#page_sidebar_navigation').css('top', offset);
	screen_size = $(window).width();
	$(window).scroll(function () {
		if( ($(window).scrollTop() > 50) && (screen_size > 1200)) {
	      $('.logo').addClass('animated-logo');
	      $('#page_sidebar_navigation').css('top', offset - 49);
	    } else {
	      $('.logo').removeClass('animated-logo');
	      $('#page_sidebar_navigation').css('top', offset);
	    }
	});
	$('#video-home').height($(window).height() - $('#header').height());

	  // Navigation dropdowns on hover
  if ($(window).width() > 1199) {
    $('#navbar-nav li.dropdown').on("tap mouseenter", function() {
      $(this).stop(true, true).delay(300).queue(function(next){
        $(this).addClass('open');
      });
    });
    $('#navbar-nav li.dropdown').on("mouseleave", function() {
      $(this).stop(true, true).delay(300).queue(function(next){
        $(this).removeClass('open');
      });
    });
  } else {
    $('#navbar-nav li.dropdown a.root-taxon').on("click", function(event) {
      if (!$(this).parent().hasClass('open')){
        event.preventDefault();
        $('#navbar-nav li.dropdown').removeClass('open');
        $(this).stop(true, true).queue(function(next){
          $(this).parent().addClass('open');
        });
      }
    });
  }
});

$(document).on('click', '#page_sidebar_navigation .dropdown-menu', function (e) {
    e.stopPropagation();
});

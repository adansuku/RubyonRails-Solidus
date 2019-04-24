jQuery(function() {
  if ($('div.full-screen-grid-product ul.pagination').size() > 0) {
    return $(window).on('scroll', function() {
    	var url;
    	if ($(window).width() > 768){
    		footer_height = 700;
    	} else {
    		footer_height = 1400;
    	}      
      if ($('.pagination .next_page a').attr('href')){
      	url = $('.pagination .next_page a').attr('href');
      } else if ($('.pagination .next a').attr('href')){
      	url = $('.pagination .next a').attr('href');
      }
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - footer_height) {
        $('.pagination').html('<i class="icon-loading"></i>');
        $.getScript(url);
        return;
      }
    });
  }
});
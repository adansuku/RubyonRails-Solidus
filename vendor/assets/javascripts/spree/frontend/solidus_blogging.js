// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/frontend/all.js'

jQuery(function() {
  $('#news-archive')
    .find('ul').hide()
      .filter('.months:first').show().end()
      .filter('.posts:first').show().end()
      .end()

    .find('span:lt(2)').addClass('open').html('<i class="icon-arrow-down icon-small"></i>').end()  
    .find('span:gt(1)').html('<i class="icon-arrow-right icon-small"></i>').end()
    
    $('#news-archive span').click(function() {  
       if ($(this).hasClass('open'))
        {
          $(this).toggleClass('open').html('<i class="icon-arrow-right icon-small"></i>');
        } 
        else
        {
          $(this).toggleClass('open').html('<i class="icon-arrow-down icon-small"></i>');
        }
        
        $(this).siblings('ul:first').toggle(); 
     });                           
});

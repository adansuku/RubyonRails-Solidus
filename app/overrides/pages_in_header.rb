Deface::Override.new(:virtual_path => "spree/shared/_main_nav_bar",
                     :name => "pages_in_header",
                     :insert_bottom => "#navbar-nav",
                     :sequence => {:after => 'contact_us_in_header'},
                     :partial => "spree/static_content/static_content_header",
                     :disabled => true)
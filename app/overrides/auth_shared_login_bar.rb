Deface::Override.new(:virtual_path => "spree/shared/_main_nav_bar",
                     :name => "auth_shared_login_bar",
                     :insert_bottom => "#navbar-nav",
                     :sequence => {:after => 'static_coleccion'},
                     :partial => "spree/shared/login_bar",
                     :disabled => true)
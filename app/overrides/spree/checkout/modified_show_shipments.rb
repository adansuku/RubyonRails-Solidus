Deface::Override.new(virtual_path: 'spree/checkout/_delivery',
                     name: 'remove_h4',
                     sequence: 1,
                     remove: 'h4.stock-shipping-method-title')

Deface::Override.new(virtual_path: 'spree/checkout/_delivery',
                     name: 'remove_h5',
                     sequence: 2,
                     remove: 'h5.stock-shipping-method-title')
Deface::Override.new(virtual_path: 'spree/checkout/_delivery',
                     name: 'remove_shipping_rates',
                     sequence: 3,
                     remove: 'erb[silent]:contains("ship_form.object.shipping_rates.each do |rate|")',
                     closing_selector: 'erb[silent]:contains("end")')

Deface::Override.new(virtual_path: 'spree/checkout/_delivery',
                     name: 'remove_ul',
                     sequence: 4,
                     remove: 'ul.field.radios.shipping-methods')

Deface::Override.new(virtual_path: 'spree/checkout/_delivery',
                     name: 'insert_new_method_shipping',
                     sequence: 5,
                     insert_bottom: 'div.shipment',
                     partial: 'spree/checkout/modified_shipping_method' )

Deface::Override.new(virtual_path: 'spree/checkout/_delivery',
                     name: 'insert_new_info',
                     sequence: 6,
                     insert_after: 'h4.stock-location',
                     text: '<% if @order.total.to_i >= @order.store.minimum_order_value.to_i %>
                                  <h5 class="alert alert-info"><%= t(:free_delivery) %></h5>
                               <% end %>' )
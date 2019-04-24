Deface::Override.new(virtual_path: 'spree/admin/products/_form',
					 name: 'add_checkbox_for_featured_products',
					 insert_after: 'div[data-hook="admin_product_form_promotionable"]',
					 text: '<%= f.field_container :featured_product do %>
						        <%= f.check_box :featured_product %>
						        <%= f.label Spree.t(:featured_product) %>
							<% end %>')

Deface::Override.new(virtual_path: 'spree/admin/products/_form',
					 name: 'add_composition_and_care',
					 insert_after: 'div[data-hook="admin_product_form_description"]',
					 text: '<div data-hook="admin_product_form_composition_and_care">
					          <%= f.field_container :composition_and_care do %>
					            <%= f.label :composition_and_care %>
					            <%= f.text_area :composition_and_care, :class => "fullwidth" %>
					            <%= f.error_message_on :composition_and_care %>
					          <% end %>
					        </div>')












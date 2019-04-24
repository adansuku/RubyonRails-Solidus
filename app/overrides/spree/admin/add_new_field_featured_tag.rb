Deface::Override.new(virtual_path: 'spree/admin/products/_form',
					 name: 'add_new_field_featured_tag',
					 insert_after: 'div[data-hook="admin_product_form_slug"]',
					 text: '<%= f.field_container :featured_tag do %>
					 					<%= f.label :featured_tag %>
						        <%= f.text_area :featured_tag %>
							<% end %>')
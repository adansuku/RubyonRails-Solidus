Deface::Override.new(virtual_path: 'spree/admin/taxons/_form',
					 name: 'add_available_on_to_taxons',
					 insert_after: "erb[loud]:contains('f.field_container :icon')",
					 text: "<%= f.field_container :available_on do %>
						        <%= f.label Spree.t(:available_on) %><br />
						        <%= f.text_field :available_on, :value => datepicker_field_value(@taxon.available_on), :class => 'datepicker fullwidth'  %>
							<% end %>")









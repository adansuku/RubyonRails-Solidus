Deface::Override.new(virtual_path: 'spree/admin/general_settings/edit',
					 name: 'add_preferences_orders_and_shipments',
					 insert_before: ".filter-actions.form-buttons",
				     text: '<fieldset class="no-border-bottom">
						    	<legend align="center"><%= Spree.t(:orders_and_shipments_settings)%></legend>
						    	<% @preferences_order_and_shipments.each do |key|
						        	type = Spree::Config.preference_type(key) %>
						        	<div class="field">
						          	<%= label_tag(key, Spree.t(key)) + tag(:br) if type != :boolean %>
						          	<%= preference_field_tag(key, Spree::Config[key], :type => type) %>
						          	<%= label_tag(key, Spree.t(key)) + tag(:br) if type == :boolean %>
						        	</div>
						    	<% end %>
						  	</fieldset>',
					 disabled: true)

Deface::Override.new(virtual_path: 'spree/admin/general_settings/edit',
					 name: 'add_minimum_order_value_to_store',
					 insert_before: "div[data-hook='admin_general_setting_default_tax_country']",
			     	 text: '<div data-hook="admin_general_setting_imput_minimum_order_value">
					    		<%= f.field_container :minimum_order_value do %>
					    			<%= f.label :minimum_order_value %>
					    			<%= f.text_field :minimum_order_value, class: "fullwidth" %>
					    			<%= f.error_message_on :minimum_order_value %>
					    		<% end %>
					    	</div>',
					 :original => '955cb36113cfafc877c404e55ddeee69a96fb7c7')
Deface::Override.new(virtual_path: 'spree/admin/orders/edit',
					 name: 'add_notice_for_orders_with_specials_instructions',
					 insert_after: 'div[data-hook="admin_order_edit_header"]',
					 text: '<% if @order.sent_as_a_gift.present? || @order.bill_address.request_invoice.present? || @order.picked_store.present? %>
						 		<div class="alert alert-warning">
						 			<h3><%= Spree.t(:order_notice) %></h3>
									<% if @order.sent_as_a_gift.present? %>
										<p><%= Spree.t(:sent_as_a_gift_info) %></p>
										<% if @order.send_gift_text.present? %>
											<p><%= Spree.t(:message) %>: <strong><%= @order.send_gift_text %></strong></p>
										<% else %>
											<p><%= Spree.t(:without_message) %></p>
										<% end %>
									<% end %>
									<% if @order.bill_address.request_invoice.present? %>
										<p><%= Spree.t(:request_invoice_info) %></p>
									<% end %>
									<% if @order.picked_store.present? %>
										<p><%= Spree.t(:picked_store_selected) %>: <strong><%= @order.picked_store %></strong></p>
									<% end %>
								</div>
							<% end %>')
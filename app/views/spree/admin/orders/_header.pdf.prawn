fill_color "A8586C"
if @hide_prices
  text Spree.t(:packaging_slip), :align => :right, :style => :bold, :size => 15
else
  text Spree.t(:customer_invoice), :align => :right, :style => :bold, :size => 12
end
fill_color "000000"


font @font_face,  :size => 9,  :style => :bold
if Spree::PrintInvoice::Config.use_sequential_number? && @order.invoice_number.present? && !@hide_prices
  text "#{Spree.t(:invoice_number)} F#{@order.invoice_number}", :align => :right
  text "#{Spree.t(:order_number, number: @order.number )}", :align => :right
  text "#{Spree.t(:invoice_date)} #{I18n.l @order.completed_at.to_date}", :align => :right
else
  text "#{Spree.t(:order_number, number: @order.number )}", :align => :right
  text "#{Spree.t(:invoice_date)} #{I18n.l @order.completed_at.to_date}", :align => :right
end

move_down 50
@order.payments.each do |payment|
   if payment.present? && payment.state.present? && payment.state != 'void'
      text "#{Spree.t(:payment_method)}: " + truncate(payment_method_name(payment), :length => 120, :escape => false), :align => :left
      break; ## Nota Héctor 19-04-2016. Ponemos sólo el primer método de pago
   end
end

move_up 110
fill_color "000000"
text Spree.t(:company_name), :align => :left, :size => 10
text " #{Spree.t(:company_direction)}", :align => :left, :size => 10
text " #{Spree.t(:company_codezip)} #{Spree.t(:company_state)}", :align => :left, :size => 10
text Spree.t(:company_phone), :align => :left, :size => 10
text Spree.t(:company_ident_fiscal), :align => :left, :size => 10

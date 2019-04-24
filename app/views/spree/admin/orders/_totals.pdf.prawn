#Nota Hector 04/11/2015 items en la primera página con totals, sin totals son 13
first_page_items = 14
first_page_item_with_total = first_page_items - 4
last_page_items_with_total = first_page_items + 4
items_per_page = 22 
totals = []
shipments = 0
promotions = 0
# Nota Noel Variables añadidas para convertir la factura en rectificativa
iva = 0 
@order.all_adjustments.tax.eligible.each_with_index do |charge, index|
     iva += charge.amount
end

rows_totals = 2  # Variable para footer height dinamico ( nº filas = nº adjustments )

# Promotions

@order.adjustments.eligible.each do |charge|
  promotions -= charge.amount
  totals << [make_cell( charge.label + ":", :font_style => :bold, :align => :right), make_cell( charge.display_amount.to_s, :align => :right)]
  rows_totals+=1
end


@order.line_item_adjustments.nonzero.promotion.eligible.group_by(&:label).each do |label, adjustments|
  amount = adjustments.sum(&:amount)
  promotions -= amount
  amount = Spree::Money.new( amount , { currency: Spree::Config[:currency] }).to_s
  totals << [make_cell( label + ":", :font_style => :bold, :align => :right), make_cell(amount, :align => :right)]
  rows_totals+=1
end



# Shipments Chargers

@order.shipments.each do |shipment|
  shipments += shipment.amount
  totals << [make_cell( shipment.shipping_method.name + ":", :font_style => :bold, :align => :right), make_cell( shipment.display_discounted_cost.to_s , :align => :right)]
  rows_totals+=1
end

# Subtotal without Taxes

subtotal = Spree::Money.new(@order.item_total - iva - promotions + shipments, { currency: Spree::Config[:currency] }).to_s
totals << [make_cell( Spree.t(:subtotal) , :font_style => :bold, :align => :right), make_cell( (subtotal), :align => :right)]

# Taxes

len = @order.all_adjustments.tax.eligible.length
total_amount=0
@order.all_adjustments.tax.eligible.each_with_index do |charge, index|
     total_amount += charge.amount
     if index+1 == len
        amount = Spree::Money.new(total_amount, { currency: Spree::Config[:currency] }).to_s
        totals << [make_cell( charge.label + ":", :font_style => :bold, :align => :right), make_cell( amount , :align => :right)]
        rows_totals+=1
     end
end

# Total Order

totals << [make_cell( Spree.t(:order_total), :font_style => :bold, :align => :right), make_cell( @order.display_total.to_s, :align => :right)]

no_new_page = false
last_page_items = (@order.line_items.count - first_page_items) % items_per_page
last_page_items = 22 if(last_page_items == 0)
number_of_pages = ((@order.line_items.count - first_page_items) / items_per_page) + 2
bbox_index = (20.5 * rows_totals)

if ((@order.line_items.count < (first_page_item_with_total)) || (last_page_items < last_page_items_with_total))
    no_new_page = true
end

if no_new_page
    bbox_index = 124 if( number_of_pages > 2 )
    bounding_box( [0,bbox_index], :width => 540, :height => 145 ) do
      table totals,
        :position => :right,
        :column_widths => { 0 => 470, 1 => 70 }

    end
else
    start_new_page
    bounding_box( [0,700], :width => 540, :height => 700 ) do
      table totals,
        :position => :right,
        :column_widths => { 0 => 470, 1 => 70 }

    end
end
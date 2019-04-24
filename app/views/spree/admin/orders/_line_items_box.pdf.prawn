first_page_items = 14
items_per_page = 22
product_title_max_length = 60

data = []

if @hide_prices
  @column_widths = { 0 => 100, 1 => 165, 2 => 75, 3 => 75 }
  @align = { 0 => :left, 1 => :left, 2 => :right, 3 => :right }
  data << [Spree.t(:sku), Spree.t(:item_description), Spree.t(:options), Spree.t(:qty)]
else
  @column_widths = { 0 => 60, 1 => 255, 2 => 95, 3 => 50, 4 => 30, 5 => 50 }
  @align = { 0 => :left, 1 => :left, 2 => :left, 3 => :right, 4 => :right, 5 => :right}
  data << [Spree.t(:sku), Spree.t(:item_description), Spree.t(:options), Spree.t(:price), Spree.t(:qty), Spree.t(:total)]
end

lineitemssku_hash = {}
@order.line_items.each do |item|
	#Nota Hector 13/10/2015 Las referencias pueden ser (2006 marino) nos quedamos con el 2006 y le ponemos el variant id como la parte decimal
	lineitemssku_hash[(item.variant.product.sku.to_i.to_s+"."+item.variant.id.to_s).to_f] = item
end


bounding_box( [0,470], :width => 540, :height => 470 ) do
    #Nota Hector 13/10/2015 construimos hash ordenada por referencia
    #@order.line_items.each.with_index do |item, index|
    lineitemssku_hash.sort.each_with_index do |(key, item), index|
      if index+1 <= first_page_items
          #Nota Hector 04/11/2015 hacemos que los productos ocupen 2 lineas
          times_x =  ((product_title_max_length - item.variant.product.name.length) > 0)? product_title_max_length - item.variant.product.name.length : 0
          times_x.times{|i| item.variant.product.name += "   " }
          row = [ item.variant.product.sku, item.variant.product.name]
          row << item.variant.options_text
          row << item.single_display_amount.to_s unless @hide_prices
          row << item.quantity
          row << item.display_total.to_s unless @hide_prices
          data << row
      end
    end

    table(data, :width => @column_widths.values.compact.sum, :column_widths => @column_widths) do
      cells.border_width = 0.5

      row(0).borders = [:bottom]
      row(0).font_style = :bold

      last_column = data[0].length - 1
      row(0).columns(0..last_column).borders = [:top, :right, :bottom, :left]
      row(0).columns(0..last_column).border_widths = [0.5, 0, 0.5, 0.5]

      row(0).column(last_column).border_widths = [0.5, 0.5, 0.5, 0.5]

    end
    transparent(1) { stroke_bounds }
end

if @order.line_items.count > first_page_items
    start_new_page
    data = []
    bounding_box( [0,700], :width => 540, :height => 700 ) do
        #Nota Hector 13/10/2015 construimos hash ordenada por referencia
        #@order.line_items.each.with_index do |item, index|
        lineitemssku_hash.sort.each_with_index do |(key, item), index|
          if index+1 > first_page_items
              #Nota Hector 04/11/2015 hacemos que los productos ocupen 2 lineas
              times_x =  ((product_title_max_length - item.variant.product.name.length) > 0)? product_title_max_length - item.variant.product.name.length : 0
              times_x.times{|i| item.variant.product.name += "  " }
              row = [ item.variant.product.sku, item.variant.product.name]
              row << item.variant.options_text
              row << item.single_display_amount.to_s unless @hide_prices
              row << item.quantity
              row << item.display_total.to_s unless @hide_prices
              data << row
          end
        end

        table(data, :width => @column_widths.values.compact.sum, :column_widths => @column_widths) do
          cells.border_width = 0.5

          row(0).borders = [:bottom]
          row(0).font_style = :bold

          last_column = data[0].length - 1
          row(0).columns(0..last_column).borders = [:top, :right, :bottom, :left]
          row(0).columns(0..last_column).border_widths = [0.5, 0, 0.5, 0.5]

          row(0).column(last_column).border_widths = [0.5, 0.5, 0.5, 0.5]
        end
        transparent(1) { stroke_bounds }
    end
end


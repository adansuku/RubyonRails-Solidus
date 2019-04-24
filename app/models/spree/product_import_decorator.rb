Spree::ProductImport.class_eval do
  # Se modifica el campo available_on para que en caso de estar en blanco desactive los productos
  def _import_data
    begin
      log("import data start",:debug)
      @products_before_import = Spree::Product.all
      @skus_of_products_before_import = @products_before_import.map(&:sku)
      file_attached =  self.data_file.url(:default, timestamp: false)
      csv_string = open(file_attached, "r:#{encoding_csv}").read.encode('utf-8')
      rows = CSV.parse(csv_string, :col_sep => separatorChar)

      if Spree::ProductImport.settings[:first_row_is_headings]
        col = get_column_mappings(rows[0])
      else
        col = Spree::ProductImport.settings[:column_mappings]
      end

      rows[Spree::ProductImport.settings[:rows_to_skip]..-1].each do |row|
        product_information = {}

        #Automatically map 'mapped' fields to a collection of product information.
        #NOTE: This code will deal better with the auto-mapping function - i.e. if there
        #are named columns in the spreadsheet that correspond to product
        # and variant field names.

        col.each do |key, value|
          #Trim whitespace off the beginning and end of row fields
          row[value].try :strip!
          product_information[key] = row[value]
        end

        #Manually set available_on if it is not already set
        #product_information[:available_on] = nil if product_information[:available_on].nil?

        if (product_information[:shipping_category_id].nil?)
          sc = Spree::ShippingCategory.first
          product_information[:shipping_category_id] = sc.id unless sc.nil?
        end

        log("#{pp product_information}",:debug)

        variant_comparator_field = Spree::ProductImport.settings[:variant_comparator_field].try :to_sym
        variant_comparator_column = col[variant_comparator_field]

        if Spree::ProductImport.settings[:create_variants] and variant_comparator_column and
            #p = Product.with_translations().where(Product.table_name+'.'+variant_comparator_field.to_s => row[variant_comparator_column]).first #only(:product,:where)
            p = Spree::Product.where(variant_comparator_field.to_s => row[variant_comparator_column]).first #only(:product,:where)
          # Product exists
          p.update_attribute(:deleted_at, nil) if p.deleted_at #Un-delete product if it is there
          p.variants.each { |variant| variant.update_attribute(:deleted_at, nil) }
          update_product(p,product_information)
        else
          #product doesn't exists
          if (@skus_of_products_before_import.include?(product_information[:sku]))
            log(msg="SKU #{product_information[:sku]} exists, but slug #{row[variant_comparator_column]} not exists!! ",:error)
            raise ProductError, msg
          end
          next unless create_product(product_information)
        end
      end
    end
    # Finished Importing!
    complete
    return [:notice, "Product data was successfully imported."]
  end
end
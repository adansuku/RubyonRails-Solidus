Spree::TaxonsController.class_eval do
    def show
      @taxon = Spree::Taxon.find_by!(permalink: params[:id])
      return unless @taxon

      if params[:search].present? && params[:search][:in_taxons].present?
        @searcher = build_searcher(params.merge(include_images: true))
      else
        @searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
      end

      order = params[:order]
      case order
        when "descend_by_popularity" then @products = @searcher.retrieve_products.descend_by_popularity
        when "descend_by_master_price" then @products = @searcher.retrieve_products.descend_by_master_price
        when "ascend_by_master_price" then @products = @searcher.retrieve_products.ascend_by_master_price
        when "descend_by_name" then @products = @searcher.retrieve_products.descend_by_name
        when "ascend_by_name" then @products = @searcher.retrieve_products.ascend_by_name
        when "descend_by_updated_at" then @products = @searcher.retrieve_products.descend_by_updated_at
        when "ascend_by_updated_at" then @products = @searcher.retrieve_products.ascend_by_updated_at
        else @products = @searcher.retrieve_products
      end
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end
end
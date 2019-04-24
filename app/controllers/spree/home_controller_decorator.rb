Spree::HomeController.class_eval do
	def index
	  @searcher = build_searcher(params.merge(include_images: true))
	  @products = @searcher.retrieve_products
	  @taxonomies = Spree::Taxonomy.includes(root: :children)
	  @featured_product = Spree::Product.where(featured_product: true).order(updated_at: :desc).first(9)
	end	
end
Spree::ProductsController.class_eval do
	def index
	  if params[:keywords].present?
		  keywords = params[:keywords]
		  params[:keywords] = params[:keywords][0...-2] + '%'
		end
    @searcher = build_searcher(params.merge(include_images: true))
    @products = @searcher.retrieve_products
    @taxonomies = Spree::Taxonomy.includes(root: :children)
    params[:keywords] = keywords if keywords.present?
  end
end
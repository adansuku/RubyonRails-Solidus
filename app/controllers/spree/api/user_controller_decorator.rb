Spree::Api::UsersController.class_eval do
	def index
		collection_scope = model_class.accessible_by(current_ability, :read)
	    if params[:ids]
	      ids = params[:ids].split(",").flatten
	      collection_scope = collection_scope.where(id: ids)
	    else
	      collection_scope = collection_scope.ransack(params[:q]).result.distinct
	    end

	    @collection = paginate(collection_scope)
	    instance_variable_set("@#{controller_name}", @collection)

	    respond_with(@collection)
	end
end
Spree::UserRegistrationsController.class_eval do
  def create
    build_resource(spree_user_params)
    if resource.save
      set_flash_message(:notice, :signed_up)
      sign_in(:spree_user, resource)
      session[:spree_user_signup] = true
      Spree::UserMailer.user_welcome_email(resource).deliver_later
      respond_with resource, location: after_sign_up_path_for(resource)
    else
      clean_up_passwords(resource)
      flash[:error] = resource.errors.full_messages.first.to_s
      respond_with(resource) do |format|
        format.html { render :new }
      end
    end
  end
end
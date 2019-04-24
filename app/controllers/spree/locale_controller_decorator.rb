Spree::LocaleController.class_eval do
  def set
		if request.referer && request.referer.starts_with?('http://' + request.host)
	        session['user_return_to'] = request.referer
		end
		if spree_current_user
	      spree_current_user.locale = params[:switch_to_locale].to_s
	      spree_current_user.save
		end
		if params[:switch_to_locale] && I18n.available_locales.map(&:to_s).include?(params[:switch_to_locale])
			session[:locale] = I18n.locale = params[:switch_to_locale]
			flash.notice = Spree.t(:locale_changed)
		else
			flash[:error] = Spree.t(:locale_not_changed)
		end
	    redirect_back_or_default(spree.root_path)
	end
end
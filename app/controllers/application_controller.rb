class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_referrer_country


  # Lograge method for adding extra info to Logging
  def append_info_to_payload(payload)
    super
    payload[:remote_ip] = request.remote_ip
    payload[:user_id] = if current_spree_user.present? && current_spree_user.admin?
                          "admin(#{current_spree_user.try(:id)})"
                        elsif current_spree_user.present?
                          current_spree_user.try(:id)
                        else
                          :guest
                        end
  end

  def set_referrer_country
    if Rails.env.development?
      session[:referrer_country] = 'ES'
    end
    return session[:referrer_country] if session[:referrer_country].present?
    session[:referrer_country] = (env['HTTP_CF_IPCOUNTRY'].present?) ? env['HTTP_CF_IPCOUNTRY'] : 'XX'
  end


end

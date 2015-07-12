class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  before_action :configure_sign_up_params, if: :devise_controller?

  # def after_sign_in_path_for(resource)
  #   user_path(current_user.id)
  # end

  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :email
    devise_parameter_sanitizer.for(:sign_up) << :zip_code
    devise_parameter_sanitizer.for(:sign_up) << :school_name
  end

end

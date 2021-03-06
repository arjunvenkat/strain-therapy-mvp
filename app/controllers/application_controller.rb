class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_activity
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_in) << :username
    devise_parameter_sanitizer.for(:account_update) << :username
    devise_parameter_sanitizer.for(:account_update) << :preferred_method
    devise_parameter_sanitizer.for(:account_update) << :zodiac_sign
  end

  def user_activity
    current_user.try :touch
  end

end

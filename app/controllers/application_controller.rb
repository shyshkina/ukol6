class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # redirect if not logged in
  before_action :authenticate_user!

  before_filter :configure_permitted_parameters, if: :devise_controller?

  check_authorization :unless => :devise_controller?

  protected

  def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:user) << :avatar
    devise_parameter_sanitizer.for(:account_update) << :avatar
    devise_parameter_sanitizer.for(:sign_up) << :avatar  
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end

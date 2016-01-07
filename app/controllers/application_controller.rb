class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected
  
  rescue_from CanCan::AccessDenied do |e|
    flash[:danger] = "access denied!"
    redirect_to root_url
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sing_up)        << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end
end

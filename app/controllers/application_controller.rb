class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization :unless => :devise_controller?
  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :back, alert: exception.message
  end

  rescue_from ActionController::RedirectBackError do
    redirect_to root_path
  end
end

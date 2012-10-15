class ApplicationController < ActionController::Base
  protect_from_forgery

  check_authorization :unless => :devise_controller?
  before_filter :authenticate_user!, :check_for_password_reset
  skip_before_filter :check_for_password_reset, :if => :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_back
  end

  #
  # Overrides cancan's current_ability so that we use the one defined in the
  # the model, just in case it gets additional functionality
  #
  # See https://github.com/ryanb/cancan/wiki/ability-for-other-users for more
  # information.
  #
  def current_ability
    current_user.ability
  end

  def redirect_back
    redirect_to :back
    rescue ActionController::RedirectBackError
      redirect_to root_path
  end

private

  #
  # Redirect to user to password reset form is they need to
  #
  def check_for_password_reset
    if current_user.needs_password_reset?
      redirect_to change_password_user_path(current_user),
       notice: "You must change your password before continuing"
    end
  end

  #
  #
  #
  def permitted_params
    @permitted_params ||= PermittedParams.new(params, current_user)
  end
end

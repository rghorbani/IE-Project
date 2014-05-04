class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?


  def ban_resident_area
    redirect_to('/') if current_user.has_role? :resident
  end

  def after_sign_up_path_for(resource)
    new_profile_path
  end

  def after_confirmation_path_for(resource)
  	new_profile_path
  end

  def after_sign_in_path_for(resource)
    if current_user.profile == nil
      new_profile_path
    else
      request.env['omniauth.origin'] || '/charge/dashboard'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, roles: [])}
  end
end

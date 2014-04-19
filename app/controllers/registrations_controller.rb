class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    flash[:notice] = 'Welcome! Please follow the steps!'
    new_profile_path
  end

end
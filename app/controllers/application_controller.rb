class ApplicationController < ActionController::Base
  # def current_user
  #   User.first
  # end
  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?
  
  protected

  def after_sign_in_path_for(resource)
    users_path
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :bio, :email, :password, :password_confirmation, :current_password)
    end
  end

end

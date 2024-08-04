class ApplicationController < ActionController::API
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name surname phone_number driving_license_number dob password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name surname phone_number driving_license_number dob password])
  end
end
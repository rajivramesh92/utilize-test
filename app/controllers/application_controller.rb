class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :info, :danger, :warning

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :email, :password, address_attributes: [:full_address, :pin_code, :phone_number, :user_id])}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :email, :password, :current_password, address_attributes: [full_address, :pin_code, :phone_number, :user_id])}
  end
end

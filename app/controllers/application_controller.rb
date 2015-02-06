class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:website, :display_name, :post_code, :address_line_1, :address_line_2, :description, :password, :password_confirmation, :email) }
 	end

 	 def configure_permitted_parameters
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:website, :display_name, :post_code, :address_line_1, :address_line_2, :description) }
 	end
end

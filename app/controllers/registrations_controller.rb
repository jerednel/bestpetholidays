class RegistrationsController < Devise::RegistrationsController
 
  private
 
  def sign_up_params
    params.require(:sitter).permit(:rate, :email, :website, :display_name, :post_code, :address_line_1, :address_line_2, :description, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:sitter).permit(:rate, :email, :website, :display_name, :post_code, :address_line_1, :address_line_2, :description, :password, :password_confirmation, :current_password)
  end
end

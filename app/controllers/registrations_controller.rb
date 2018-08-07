class RegistrationsController < Devise::RegistrationsController
	#esse controller é para reescrever o controller original do devise por conta do novo campo name
  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
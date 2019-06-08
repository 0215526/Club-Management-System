class RegistrationsController < Devise::RegistrationsController

    private

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :gender, :dob, :designation, :company, :address, :email, :password, :password_confirmation,:admin)
    end
  
    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :gender, :dob, :designation, :company, :address, :email, :password, :password_confirmation, :current_password, :admin)
    end
  end
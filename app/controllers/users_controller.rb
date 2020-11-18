class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:user_id, :password, :password_confirmation, :email, :email_confirmation, :room_id)
  end

  def create
    begin
      @user = User.create!(user_params)
    rescue ActiveRecord::RecordInvalid => ex
      redirect_to new_user_path, flash: { notice: 'Invalid credentials' }
      return
    end
    redirect_to login_path, flash: { notice: 'Welcome. Your account was successfully logged in.' }
  end

end

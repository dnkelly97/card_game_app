class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:user_id, :password, :password_confirmation, :email, :email_confirmation)
  end

  def create
    begin
      @user = User.create!(user_params)
    rescue ActiveRecord::RecordInvalid => ex
      flash[:error] = 'Invalid credentials'
      redirect_to new_user_path
      return
    end
    flash[:notice] = "Welcome, #{@user.user_id}. Your account was successfully created."
    redirect_to login_path
  end

end

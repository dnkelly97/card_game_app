class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:user_id, :password, :password_confirmation, :email, :password_confirmation, :session_token)
  end

  def create
    @user = User.create!(user_params)
    if @user.nil? || !@user.valid?
      flash[:error] = 'Invalid credentials'
      redirect_to new_user_path
      return
    end

    flash[:notice] = "Welcome, #{@user.user_id}. Your account was successfully created."
    redirect_to login_path
  end

end

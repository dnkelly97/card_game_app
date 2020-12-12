class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:user_id, :password, :password_confirmation, :email, :email_confirmation, :room_id)
  end

  def create
    begin
      @user = User.create!(user_params)
    rescue ActiveRecord::RecordInvalid => ex
      output = ['Invalid credentials:']
      ex.to_s.split(',').each { |ele| output << ele}
      redirect_to new_user_path, flash: { warning: output.join('<br/>') }
      return
    end
    redirect_to login_path, flash: { notice: 'Your account was successfully created.'}
  end

end

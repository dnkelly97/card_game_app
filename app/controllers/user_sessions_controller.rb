class UserSessionsController < ApplicationController
  def session_params
    params.require(:user).permit(:user_id, :password, :email, :session_token)
  end

end

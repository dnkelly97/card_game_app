class UserSessionsController < ApplicationController
  def session_params
    params.require(:user).permit(:user_id, :password)
  end

end

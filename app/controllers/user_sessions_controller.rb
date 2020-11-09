class UserSessionsController < ApplicationController
  def session_params
    params.require(:user).permit(:email, :password)
  end

  def create
    if session_params.has_key?(:password) and session_params.has_key?(:email)
      # Check that the combination gets a user with both

      @current_user = User.where({ email: session_params[:email] }).to_a[0]
      if @current_user.authenticate( session_params[:password] )
        session[:session_token] = @current_user.session_token
        flash[:notice] = 'Welcome. Your account was successfully logged in.'
        redirect_to dashboard_path
        return
      end
    end

    flash[:notice] = 'Unsuccessful login'
    redirect_to login_path
  end

  def destroy
    session[:session_token] = nil
    flash[:notice] = 'Successfully logged out.'
    # Maybe should change the session token for next time
    redirect_to login_path
  end
end

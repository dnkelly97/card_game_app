class UserSessionsController < ApplicationController
  def session_params
    params.require(:user).permit(:email, :password)
  end

  def index
    @current_user ||= session[:session_token] && User.find_by_session_token(session[:session_token])
  end

  def new
    render(partial: 'partials/login') if request.xhr?
  end

  def create
    if session_params.has_key?(:password) && session_params.has_key?(:email)
      # Check that the combination gets a user with both

      @current_user = User.where({ email: session_params[:email] }).to_a[0]
      if @current_user&.authenticate(session_params[:password])
        session[:session_token] = @current_user.session_token
        redirect_to dashboard_path, flash: { notice: "Welcome #{@current_user.user_id}.
                                              Your account was successfully logged in." }
        return
      end
    end
    redirect_to login_path, flash: { warning: 'Unsuccessful login' }
  end

  def destroy
    session[:session_token] = nil
    # Maybe should change the session token for next time
    redirect_to dashboard_path, flash: { notice: 'Successfully logged out.' }
  end
end

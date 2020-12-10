class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def set_current_user
    @current_user ||= session[:session_token] && User.find_by_session_token(session[:session_token])
    cookies.encrypted[:user_id] = @current_user.id if @current_user
    redirect_to dashboard_path, notice: "You must be logged in to do that" unless @current_user
  end

  def clear_current_user
    @current_user = nil
  end
end

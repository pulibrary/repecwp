class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_current_user!
  before_action :authenticate_user!

  def get_current_user!
    @current_user = User.from_omniauth(session[:omniauth]) if session[:omniauth]
  end

  def authenticate_user!
    redirect_to '/' unless @current_user
  end
end

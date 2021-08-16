class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  helper_method :current_user

  def authenticate_user!
    request.path_info = request.path_info.sub(/^\/\//,'/')
    super
  end
end

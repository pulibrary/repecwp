class OmniauthCallbacksController < ActionController::Base
  def cas
    omniauth_hash = {'provider' => request.env["omniauth.auth"]&.provider, 'uid' => request.env["omniauth.auth"]&.uid}
    @user = User.from_omniauth(omniauth_hash)

    if @user
      reset_session
      redirect_to root_path
      session[:omniauth] = omniauth_hash
      Rails.logger.debug("User #{omniauth_hash['uid']} logged in")
      flash[:notice] = 'Successfully authenticated from CAS account.'
    else
      redirect_to root_path
      flash[:notice] = 'You are not authorized to manage this application'
      Rails.logger.debug("User #{omniauth_hash['uid']} attempted to log in but did not have an account")
    end
  end
end

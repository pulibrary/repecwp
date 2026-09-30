class OmniauthCallbacksController < ActionController::Base
  def entra_id
    omniauth_hash = {
      'provider' => request.env["omniauth.auth"]&.provider,
      'uid' => request.env['omniauth.auth'].extra&.raw_info&.unique_name&.partition('@princeton.edu').first
    }
    @user = User.from_omniauth(omniauth_hash)

    if @user
      reset_session
      redirect_to root_path
      session[:omniauth] = omniauth_hash
      Rails.logger.debug("User #{omniauth_hash['uid']} logged in")
      flash[:notice] = 'Successfully authenticated from your Princeton account.'
    else
      redirect_to root_path
      flash[:notice] = 'You are not authorized to manage this application'
      Rails.logger.debug("User #{omniauth_hash['uid']} attempted to log in but did not have an account")
    end
  end
end

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def cas
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    
    unless @user.nil?
      sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "CAS") if is_navigational_format?
    else
      redirect_to root_path
      flash[:notice] = 'You are not authorized to manage this application'
    end
  end

  def failure
    redirect_to root_path
  end
end

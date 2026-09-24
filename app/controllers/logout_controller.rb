class LogoutController < ActionController::Base
    def logout
        session[:omniauth] = nil
        redirect_to '/'
    end
end

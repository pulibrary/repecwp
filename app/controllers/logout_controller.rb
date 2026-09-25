class LogoutController < ActionController::Base
    def logout
        reset_session
        redirect_to '/'
    end
end

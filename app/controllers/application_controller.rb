class ApplicationController < ActionController::Base
    include SessionsHelper

    before_action :require_login

    private

    def require_login
        if !(logged_in?)
            flash[:alert] = t("common.login_required")
            redirect_to new_session_path
        end
    end
end

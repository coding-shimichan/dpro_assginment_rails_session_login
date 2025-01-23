class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)

        if user&.authenticate(params[:session][:password])
            log_in(user)
            redirect_to tasks_path
        else
            flash[:alert] = "email or password is incorrect"
            render :new
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to new_session_path
    end
end

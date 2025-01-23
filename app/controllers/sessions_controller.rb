class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)

        if user&.authenticate(params[:session][:password])
            log_in(user)
            flash[:notice] = t(".created")
            redirect_to tasks_path
        else
            flash[:alert] = t(".failed")
            render :new
        end
    end

    def destroy
        session.delete(:user_id)
        flash[:notice] = t(".destroyed")
        redirect_to new_session_path
    end
end

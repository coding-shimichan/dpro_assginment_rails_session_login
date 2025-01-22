class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)

        if user&.authenticate(params[:session][:password])
            redirect_to tasks_path
        else
            render :new
        end
    end
end

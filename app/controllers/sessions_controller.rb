class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)

        if user&.authenticate(params[:session][:password])
            render json: { result: "Successfully logged in!", user: user}
        else
            render json: { result: "Login failed!"}
        end
    end
end

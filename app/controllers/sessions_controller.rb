class SessionsController < ApplicationController
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "You have successfully logged out"
    end

    def login
    end
    
    def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "You have successfully logged in."
        else
            flash[:alert] = "Invalid email or password"
            render :login
        end
    end
end
class PasswordController < ApplicationController
    before_action :redirect_guest_to_signin

    def edit
    end

    def update
        if Current.user.authenticate(params[:old_password])
            if Current.user.update(password_params)
                flash[:notice] = "Password changed successfully"
                redirect_to root_path
            else
                @errors = Current.user.errors.full_messages
                render :edit
            end
        else
            flash[:alert] = "Invalid password"
            render :edit
        end
    end

    private

    def password_params
        params.permit(:password, :password_confirmation)
    end
end
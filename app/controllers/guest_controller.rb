class GuestController < ApplicationController
    def password_reset
    end

    def send_password_reset_email
        @user = User.find_by(email: params[:email])
        if @user.present?
            PasswordMailer.with(user: @user).reset.deliver_later
        end

        redirect_to :forgot_password, notice: "If your email exists in our records, you will receive password reset instructions shortly"
    end

    def password_reset_edit
    end

    def password_reset_update
        if !params[:token].present?
            flash[:alert] = "Invalid token"
        end
        user = GlobalID::Locator.locate_signed(params[:token])
        if user.present?
            if user.update(password: params[:password], password_confirmation: params[:password_confirmation])
                redirect_to root_path, notice: "Your password has been successfully reset"
            else
                @errors = user.errors.full_messages
                render "guest/password_reset_edit", status: :unprocessable_entity
            end
        else

        end
    end
end
class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    @greeting = "Hi"
    @token = params[:user].to_sgid(purpose: "password_reset", expires: 15.minutes).to_s
    mail to: params[:user].email, subject: "TweetSync: Reset your password"
  end
end

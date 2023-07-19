class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def redirect_guest_to_signin
    redirect_to signup_path, alert: "You need to be signed in to access this page" if !Current.user.present?
  end
end

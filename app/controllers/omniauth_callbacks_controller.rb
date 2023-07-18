class OmniauthCallbacksController < ApplicationController
  def twitter
    Current.user.twitter_accounts
      .where(username: auth.info.username)
      .first_or_initialize(
        name: auth.info.name,
        username: auth.info.username,
        image: auth.info.image,
        token: auth.info.token,
        secret: auth.info.secret
      )
    redirect_to root_path, notice: "Successfully connected your twitter account"
  end

  def auth
    request.env["omniauth.auth"]
  end
end

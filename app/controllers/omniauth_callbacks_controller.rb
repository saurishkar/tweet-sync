class OmniauthCallbacksController < ApplicationController
  def twitter
    @twitter_account = Current.user.twitter_accounts
                              .where(username: auth.info.nickname)
                              .first_or_initialize(
                                name: auth.info.name,
                                username: auth.info.nickname,
                                image: auth.info.image,
                                token: auth.info.token,
                                secret: auth.info.secret
                              )
    @twitter_account.save
    redirect_to root_path, notice: 'Successfully connected your twitter account'
  end

  def auth
    request.env['omniauth.auth']
  end
end

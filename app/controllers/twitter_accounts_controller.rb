class TwitterAccountsController < ApplicationController
  before_action :redirect_guest_to_signin

  def index
    @twitter_accounts = Current.user.twitter_accounts
  end

  def destroy
    Current.user.twitter_accounts.find(params[:id]).destroy
    redirect_to twitter_accounts_path, notice: "Account disconnected successfully"
  end
end

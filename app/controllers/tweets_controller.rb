class TweetsController < ApplicationController
  before_action :redirect_guest_to_signin

  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweet = Tweet.new
    @tweet.user_id = Current.user.id
  end

  def create
    @tweet = Current.user.tweets.create(tweet_params)
    if @tweet.save
      redirect_to @tweet, notice: 'Tweet was scheduled successfully'
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :publish_at, :twitter_account_id)
  end
end

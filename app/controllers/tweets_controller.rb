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
    @tweet = set_tweet
  end

  def edit
    @tweet = set_tweet
  end

  def update
    @tweet = set_tweet
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: 'Tweet has been successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @tweet = set_tweet
    @tweet.destroy
    redirect_to tweets_path, notice: 'Tweet has been deleted'
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :publish_at, :twitter_account_id)
  end

  def set_tweet
    Current.user.tweets.find(params[:id])
  end
end

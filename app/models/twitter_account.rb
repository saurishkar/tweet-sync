class TwitterAccount < ApplicationRecord
  belongs_to :user
  has_many :tweets, dependent: :destroy
  validates :username, uniqueness: true

  def client
    Tweetkit::Client.new do |config|
      config.access_token        = token
      config.access_token_secret = secret
      config.consumer_key        = Rails.application.credentials.dig(:twitter, :api_key)
      config.consumer_secret     = Rails.application.credentials.dig(:twitter, :api_secret)
    end
  end
end

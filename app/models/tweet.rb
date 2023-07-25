class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :twitter_account, presence: true
  validates :body, length: { minimum: 10, maximum: 280 }
  validates_datetime :publish_at, on_or_after: :today

  after_initialize do
    self.publish_at ||= 24.hours.from_now
  end

  def published?
    tweet_id?
  end

  def publish_to_twitter!
    tweet = twitter_account.client.post_tweet({ text: body })
    update(tweet_id: tweet.response['data']['id'].to_i)
  end

  def username
    twitter_account.username
  end
end

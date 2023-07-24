class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :twitter_account, presence: true
  validates :body, length: { minimum: 10, maximum: 280 }
  validates_datetime :publish_at, on_or_after: :today

  after_initialize do
    self.publish_at ||= 24.hours.from_now
  end
end

class User < ApplicationRecord
  has_many :twitter_accounts
  has_many :tweets

  has_secure_password

  validates :email, presence: true, format: { with: /\A[A-Za-z0-9+_.-]+@(.+)\z/, message: 'is invalid' }
  validates :password, presence: true, length: { minimum: 8 }
end

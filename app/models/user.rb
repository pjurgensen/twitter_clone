class User < ActiveRecord::Base
  has_many :tweets
  has_many :follows

  validates :handle, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true

end

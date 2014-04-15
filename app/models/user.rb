class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets
  has_many :follows

  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :handle, presence: true
  validates :email,
            presence: true,
            format: { with: valid_email_regex },
            uniqueness: true,
            case_sensitive: false
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_digest, presence: true, uniqueness: true

end

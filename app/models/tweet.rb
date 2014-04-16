class Tweet < ActiveRecord::Base
  belongs_to :user

  validates :message, presence: true

  def find_tweeted_handles
  	users_to_email = []
  	handles_tweeted = self.message.scan(/@[A-z]*\b/)
  	if handles_tweeted
			handles_tweeted.map { | handle | handle.slice!(0) }
			handles_tweeted.each do | handle |
				users_to_email << User.find_by(handle: handle)
			end
  	end
  	users_to_email
  end

end

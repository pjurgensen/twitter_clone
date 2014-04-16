class UserMailer < ActionMailer::Base
  default from: "tweeter-team@tweeter.com"

  def signup_confirmation(user)
    @user = user

    attachments.inline['tweeter-bird.png'] = File.read('/Users/epicodus/Code/twitter_clone/app/assets/images/tweeter-bird.png')

    mail to: user.email, subject: "Sign Up Confirmation"
  end

end

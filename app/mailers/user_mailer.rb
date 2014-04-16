class UserMailer < ActionMailer::Base
  default from: "tweeter-team@tweeter.com"

  def signup_confirmation(user)
    @user = user
    # attachments.inline['tweeter-bird.png'] = File.read('/Users/epicodus/Code/twitter_clone/app/assets/images/tweeter-bird.png')
    mail to: user.email, subject: "Sign Up Confirmation"
  end

  def tagged_notification(tagged_user, tweet)
    @user = tweet.user
    @tagged_user = tagged_user
    @tweet = tweet

    mail to: tagged_user.email, subject: "#{@user.handle} tweeted about you!"
  end

end

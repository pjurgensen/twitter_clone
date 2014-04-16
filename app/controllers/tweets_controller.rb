class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      @tweet.find_tweeted_handles.each do | user_to_email |
        UserMailer.tagged_notification(user_to_email, @tweet).deliver
      end
      redirect_to tweets_path
    else
      flash[:alert] = "Your tweet was not saved - please try again"
      render 'new'
    end
  end

private

  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end
end


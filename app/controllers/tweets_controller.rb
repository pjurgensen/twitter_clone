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
      redirect_to tweets_path
    else
      render 'new'
    end
  end

private

  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end
end


class AccountController < ApplicationController
require 'twitter'
  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ""
      config.consumer_secret     = ""
      config.access_token        = current_user.token
      config.access_token_secret = current_user.secret
    end

    @followers = client.followers(:count => 10)
  end

  def show
    @follower =
  end

end

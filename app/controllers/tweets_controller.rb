require 'pry'
class TweetsController < ApplicationController
  get '/tweets' do
    if logged_in?
      @tweets = Tweet.all
      erb :'tweets/tweets'
    else
      redirect '/login'
    end
  end

  get '/tweets/new' do
    if logged_in?
      erb :'tweets/create_tweet'
    else
      redirect '/login'
    end
  end

  post '/tweets/new' do
    if !params[:content] == ""
      @tweet = Tweet.create(params)
      @tweet.user_id = current_user.id
      @tweet.save
    else
      redirect '/tweets/new'
    end
    redirect '/tweets'
  end
end

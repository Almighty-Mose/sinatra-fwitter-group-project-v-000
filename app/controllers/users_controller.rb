class UsersController < ApplicationController
  get '/signup' do
    erb :'users/create_user'

    redirect "/tweets"
  end

  get '/login' do
    erb :'users/login'
  end

  get '/tweets' do
    erb :'tweets/tweets.erb'
  end

end

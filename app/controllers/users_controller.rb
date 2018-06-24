class UsersController < ApplicationController
  get '/signup' do
    erb :'users/create_user'
  end

  get '/login' do
    erb :'users/login'
  end

  get '/tweets' do
    erb :'tweets/tweets'
  end

  post '/signup' do
    @user = User.create(params)
  end
end

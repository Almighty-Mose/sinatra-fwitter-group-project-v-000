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
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      if !@user.find_by(params[:username])
        @user = User.create(params)
      else
        "This User Already Exists!"

        redirect '/signup'
      end

    else
      redirect '/signup'
    end

    redirect '/tweets'
  end
end

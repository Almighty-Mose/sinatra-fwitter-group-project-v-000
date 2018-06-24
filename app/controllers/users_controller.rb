class UsersController < ApplicationController
  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect '/tweets'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/tweets'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user != nil && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/tweets'
    else
      redirect '/signup'
    end
  end

  post '/signup' do
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      @user = User.create(params)
      session[:user_id] = @user.id
    else
      redirect '/signup'
    end

    redirect '/tweets'
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end
end

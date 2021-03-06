class SessionsController < ApplicationController
  get '/signup' do
    redirect_if_logged_in
    erb :'sessions/signup'
  end

  post '/signup' do
    user = User.create(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect "/dragons"
    else 
      flash[:errors] = user.errors.full_messages
      redirect "/signup"
    end
  end

  get '/login' do
    redirect_if_logged_in
    erb :'sessions/login'
  end

  post'/login' do
    user = User.find_by_username(params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect '/dragons'
    else
      flash[:errors] = "Invalid login"
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

end
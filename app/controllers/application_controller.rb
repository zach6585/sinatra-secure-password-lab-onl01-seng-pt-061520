require "./config/environment"
require "./app/models/user"
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :index
  end

  get "/signup" do
    erb :signup
  end

  post "/signup" do
    user = User.new(:username => params[:username], :password => params[:password])
    # binding.pry
<<<<<<< HEAD
    if user.save && !user.username.empty? 
      session[:user_id] = user.id
      redirect to '/login'
    else
      redirect to '/failure'
=======
    if user.save && user.username != "" && 
      redirect '/account'
    else
      redirect '/failure'
>>>>>>> 998cb1e2fa5fac9ab24bd26cd1b33f319bec9f22
    end 

  end

  get '/account' do
    @user = User.find_by(:id => session[:user_id])
    erb :account
  end


  get "/login" do
    erb :login
  end

  post "/login" do
    # binding.pry
<<<<<<< HEAD
    user = User.find_by(:username => params[:username])
    if user && !user.username.empty?
      session[:user_id] = user.id
      redirect to '/account'
    else 
      redirect to '/failure'
=======
    user = User.find_by(:username => params[:username], :password => params[:password])
    if user.username != "" && user.password != ""
      session[:user_id] = user.id
      redirect '/account'
    else 
      redirect '/failure'
>>>>>>> 998cb1e2fa5fac9ab24bd26cd1b33f319bec9f22
    end 
  end

  get "/failure" do
    erb :failure
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end

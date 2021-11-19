require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
require 'sinatra/flash'
require './lib/space'
require './lib/user'
require './lib/book'


class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
    enable :sessions
  end

  get '/' do
      erb(:index)
  end

  get '/create_account' do
    erb(:create_account)
  end

  post '/create_user' do
    User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/view_spaces'
  end

  get '/sign_in' do
    session.clear
    erb(:sign_in)
  end

  post '/sign_in' do
    @user = User.find_by(username: params[:username])
    if @user == nil
      # flash.now[:message] = "Invalid Email or Password"
      redirect '/sign_in_error'
    else
      session[:username] = params[:username]
    redirect '/view_spaces'
    end
  end

  get '/sign_in_error' do
    erb :sign_in_error
  end

  get '/account' do
    erb :create_account
  end

#     @user = User.find_by(:username => params[:username])
#       if @user && @user.authenticate(params[:password])
#  session[:user_id] = @user.id
#       redirect to “/stories”
#       else
#          flash.now[:message] = “Invalid Email or Password”
#          erb :“users/login”
#       end


  get ('/book') do
    erb :booking_form
  end

  get ('/book/:id/:space_name') do
    @username = session[:username]
    @user_id = User.find_by(username: session[:username]).id
    @space_id = params["id"]
    @space_name = params["space_name"]
    erb :booking_form
  end

  post '/booking_request/:venue_name' do
    Book.create(start_date: params[:start_date], end_date: params[:end_date], user_id: params[:user_id], space_id: params[:space_id])
    @start_date = params[:start_date]
    @venue_name = params["venue_name"]
    erb :confirmation
    #redirect '/confirmation_page'
  end

  get '/createspace' do
    erb :create_space
    @username = User.find_by(username: session[:username]).id
    erb :create_space
  end

  post '/createaspace' do
    @username = session[:username]
    Space.create(name: params[:name], description: params[:description], price: params[:price], user_id: params[:user_id])
    # erb :create_space
    redirect '/view_spaces'
  end

  get '/view_spaces' do
    @username = session[:username]
    @spaces = Space.all
    erb(:view_spaces)
  end

  get '/log_out' do
    session.clear
    redirect '/sign_in'
  end

  get '/home_page' do
    erb :home_page
  end

  get '/view_page' do
    session[:username]
    @spaces = Space.all
    erb :view_page
  end

  get '/login_error' do
    erb :login_error
  end

  get '/new_space' do
    erb :new_space
  end

  run! if app_file == $PROGRAM_NAME

end

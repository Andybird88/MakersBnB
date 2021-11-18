require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
require './lib/space'
require './lib/user'
require './lib/book'


class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
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
    erb(:sign_in)
  end

  get ('/book') do
    erb :booking_form
  end

  post '/booking_request' do
    Book.create(start_date: params[:start_date], end_date: params[:end_date])
    @start_date = params[:start_date]
    erb :confirmation
    #redirect '/confirmation_page'
  end

  get '/createspace' do

    erb :create_space
  end

  post '/createaspace' do
  
    Space.create(name: params[:name], description: params[:description], price: params[:price])
    # erb :create_space
    redirect '/view_spaces'
  end

  get '/view_spaces' do
    @spaces = Space.all
    erb(:view_spaces)
  end

  run! if app_file == $PROGRAM_NAME

end

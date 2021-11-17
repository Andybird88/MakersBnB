require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
require './lib/space'


class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
  end

get '/' do
    erb(:index)
end

  get ('/book') do
    erb :booking_form
  end

  post '/booking_request' do
    erb :confirmation
    #redirect '/confirmation_page'
    
  end

  get '/createspace' do

    erb :create_space
  end

  post '/createaspace' do
    name = params[:Name]
    description = params[:Description]
    price = params[:Price]

    @spaces = Space.create(name, description, price)
    # erb :create_space
    redirect '/view_spaces'

  end

  get '/view_spaces' do
    @spaces = Space.all
    erb(:view_spaces)
  end

  run! if app_file == $PROGRAM_NAME

end

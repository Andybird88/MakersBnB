require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?


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
    # erb :create_space
    redirect '/view_spaces'

  end

  get '/view_spaces' do
    erb(:view_spaces)
  end

  run! if app_file == $PROGRAM_NAME

end

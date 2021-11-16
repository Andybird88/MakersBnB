require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?


class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
  end



  run! if app_file == $PROGRAM_NAME

end

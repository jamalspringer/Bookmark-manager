require 'sinatra'
require 'sinatra/base'

class Bookmark_mgr < Sinatra::Base
  configure do
    set :views, "app/views"
  end

  get '/' do
    "Welcome to the Bookmark Manager!"
  end

  run! if app_file == $0
end

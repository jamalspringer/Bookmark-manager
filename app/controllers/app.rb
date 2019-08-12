require 'sinatra'
require 'sinatra/base'

class Bookmark_mgr < Sinatra::Base
  get '/' do
    "Hello world!"
  end

  run! if app_file == $0
end

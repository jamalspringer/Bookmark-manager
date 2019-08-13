require 'sinatra'
require 'sinatra/base'
require_relative '../../lib/bookmark'

class Bookmark_mgr < Sinatra::Base
  configure do
    set :views, "app/views"
  end

  get '/' do
    redirect('/bookmarks')
  end

  get '/bookmarks' do
    @bookmarks = [
        "http://www.makersacademy.com",
        "http://www.destroyallsoftware.com",
        "http://www.google.com"
    ]
    erb :'bookmarks/index'
  end

  get '/bookmarks/add' do
    erb :'bookmarks/add'
  end

  post '/bookmarks/create' do
    Bookmark.create(params[:url])
    redirect('/bookmarks')

  end

  run! if app_file == $0
end

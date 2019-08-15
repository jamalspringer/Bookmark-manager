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
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/add' do
    erb :'bookmarks/add'
  end

  post '/bookmarks/create' do
    Bookmark.create(url: params['url'], title: params[:title])
    redirect('/bookmarks')
  end

  enable :sessions, :method_override

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end

require_relative '../config/environment'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id  = id
    @title = title
    @url = url
  end

  # class_eval do
  #   def is_valid_url?
  #     uri = URI.parse self
  #     uri.kind_of? URI::HTTP
  #   rescue URI::InvalidURIError
  #     false
  #   end
  # end
  #
  # def is_url?(url)
  #   if url.is_valid_url?
  #     true
  #   else
  #     false
  #   end
  # end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])}
  end

  def self.create(url:, title:)
    # return false unless is_url?(url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

end
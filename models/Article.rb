class Article
  include DataMapper::Resource

  property :id, Serial
  property :file, String

end

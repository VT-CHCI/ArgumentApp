class Article
  include DataMapper::Resource
  property :id, Serial

  property :file, String
  property :title, String
  property :description, String
  property :side, Integer

  belongs_to :scenario, :required => false
end

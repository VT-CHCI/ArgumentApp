class Article
  include DataMapper::Resource
  property :id, Serial

  property :file, String
  property :title, String
  property :description, Text
  property :side, Integer

  property :user_justification, Text
  property :user_side, Integer

  belongs_to :scenario, :required => false
end

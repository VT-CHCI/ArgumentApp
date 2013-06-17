class Article
  include DataMapper::Resource
  property :id, Serial

  property :pdf_filename, Text
  property :title, String
  property :description, Text
  property :side, Integer

  belongs_to :scenario, :required => false
  belongs_to :justification, :required => false
end

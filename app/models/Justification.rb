class Justification
  include DataMapper::Resource
  property :id, Serial

  property :justification, Text
  property :side, Integer

  # If no article, its the final justification
  has 1, :article
end

class Stack
  include DataMapper::Resource

  property :id, Serial
  property :description, Text

  has n, :articles, :through => Resource
  belongs_to :scenario, :required => false

end

class Scenario
  include DataMapper::Resource

  property :id, Serial

  property :uid, String
  property :title, String
  property :description, Text

  has n, :stacks
end

class Article
  include DataMapper::Resource
  property :id, Serial
  property :file, String
  property :title, String
  property :description, String

  belongs_to :stack, :required => false
end

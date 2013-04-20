class Stack
  include DataMapper:: Resource

  belongs_to :scenario
  property :id, Serial
  has n, :article
end

class Scenario
  include DataMapper::Resource

  property :id, Serial

  property :uid, String
  property :title, String
  property :description, Text

  has n, :stacks
end

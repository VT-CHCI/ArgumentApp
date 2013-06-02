class Scenario
  include DataMapper::Resource
  property :id, Serial

  # Set by Initial PUT
  property :uid, String
  property :title, Text
  property :description, Text
  property :side_a, Text
  property :side_b, Text

  has n, :articles

  property :user_side, Integer
  property :user_justification, Text
end

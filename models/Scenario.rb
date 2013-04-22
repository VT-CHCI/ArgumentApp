class Scenario
  include DataMapper::Resource

  property :id, Serial

  property :uid, String
  property :title, Text
  property :description, Text

  property :side_a, Text
  property :side_b, Text

  has n, :articles
end

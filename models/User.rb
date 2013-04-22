class User
  include DataMapper::Resource
  property :id, Serial

  property :name , Text
  property :cookie, Text
  property :number, Integer

  has n, :sessions
end

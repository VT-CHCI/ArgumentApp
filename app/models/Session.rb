class Scenario
  include DataMapper::Resource
  property :id, Serial

  # Set by Initial PUT
  property :uid, String

  has 1, :scenario
  has n, :justifications
  # One Justifications is for "final justification" 
  # "final justifcation" has no linked Article
end

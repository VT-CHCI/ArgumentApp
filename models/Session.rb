class Session
  include DataMapper::Resource

  property :id, Serial
  property :side, Integer
  property :final_justification, Text

  belongs_to :user
#  has 1, :scenario
end

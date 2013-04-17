class Session
  include DataMapper::Resource

  property :id, Serial
  #property :stack_a, Array
  #property :stack_b, Array

  has n, :article
end

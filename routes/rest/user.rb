post '/user/:number/' do

end

put '/user/:number' do
  user = JSON request.body.read
  new_user = User.create(
    :name   => user['name'],
    :number => user['number']
  )
  new_user.save
end

get '/user/:number' do
  user = User.all(:number => params[:number].to_i)
  if user.nil? then
    status 404
  else
    status 200
    body user.to_json
  end
end

delete '/user/:number' do

end

put '/user' do
  user = JSON request.body.read
  new_user = User.create(
    :name   => user['name'],
    :number => user['number']
  )
  new_user.save
end

post '/user/:name/' do

end

get '/user/:name' do
  user = User.all(:name => params[:name].to_i)
  if user.nil? then
    status 404
  else
    status 200
    body user.to_json
  end
end

delete '/user/:name' do

end

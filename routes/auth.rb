get '/login' do
  haml :login
end

post '/login' do
  usersWithName = User.all(:name => request.params['name'])
  if (usersWithName.size == 1 && usersWithName.first.number == request.params['number'].to_i) then
    login_as(usersWithName.first) # Stores Cookie
  else
    redirect('/login') # Login Failed
  end
end

get '/logout' do
  logout
end

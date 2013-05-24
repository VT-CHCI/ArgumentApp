get '/login' do
  haml :login
end

post '/login' do
  u = User.all(:name => request.params['name'])
  if (u == nil || u .size == 0) then
    redirect('/login')
  elsif u.first.number == request.params['numer'].to_i then
    login_as(u.first)
  else
    redirect('/login')
  end
end

get '/logout' do

end

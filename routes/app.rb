get '/login' do
  haml :login
end

post '/login' do
  # Create Sinatra Session
  u = User.all(:name => request.params['name'])

  if (u == nil || u.size == 0) then
    redirect('/login')
  elsif u.first.number == request.params['number'].to_i then
    login_as(u.first)
    "logged in"
  else
    redirect('/login')
  end
end


get '/:uid' do
  redirect "/#{params[:uid]}/pick_a_side"
end

get '/:uid/pick_a_side' do
  haml :pick_a_side  
end

get '/:uid/categorize' do
  haml :categorize
end

get '/:uid/article/:id' do
  haml :article
end

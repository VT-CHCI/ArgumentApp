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
  scenario = Scenario.all(:uid => params[:uid]).first

  if (scenario != nil) 
  haml :pick_a_side, :locals => {
    :uid         => params[:uid],
    :title       => scenario['title'],
    :description => scenario['description'],
    :side_a      => scenario['side_a'],
    :side_b      => scenario['side_b']
  }
  else
    "No Scenario for Given Uid"
  end
end

get '/:uid/categorize' do


  scenario = Scenario.all(:uid => params[:uid]).first
  if (scenario != nil)
    haml :categorize, :locals => {
      :uid => params[:uid],
      :side_a => scenario['side_a'],
      :side_b => scenario['side_b'],
      :articles => scenario.articles
    }
  else
    "Invalid Scenario UID"
  end
end


get '/:uid/article/:id' do
  #haml :pdf_view
  "Article Id #{params[:id]}"
  haml :article
end

# ============================
# Scenario
# ============================
post '/scenario/:uid' do
end

put '/scenario/:uid' do
  scn = JSON request.body.read
  puts scn
  puts "SCN: #{scn['title']}"
  puts "Description: #{scn['description']}"
  puts "Side A: #{scn['side_a']}"
  puts "Side B: #{scn['side_b']}"
  puts "UID : #{params[:uid]}"


  scenario = Scenario.create(
    :title        => scn['title'],
    :description  => scn['description'],
    :side_a       => scn['side_a'],
    :side_b       => scn['side_b'],
    :uid          => params[:uid]
  )

  scn['articles'].each do |article|
     scenario.articles << Article.create(
       :file        => article['file'],
       :title       => article['title'],
       :description => article['description'],
       :side        => article['side']
     )
  end

  scenario.save
  status 200 
  body scenario.id.to_s
end

get '/scenario/:uid' do
  scenario = Scenario.all(:uid => params[:uid])
  if scenario.nil? then
    status 404
  else
    status 200
    body scenario.to_json(:methods => [:articles])
  end
end

delete '/screnario/:uid' do

end

# ============================
# User
# ============================
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

# Update Fields
post '/scenario/:uid' do
end

put '/scenario/:uid' do
  scn = JSON request.body.read

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
       :description => article['description']
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

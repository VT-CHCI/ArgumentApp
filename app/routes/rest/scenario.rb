post '/scenario/:uid' do
end

put '/scenario/:uid' do
  scn = JSON request.body.read

  scenario = Scenario.create(
    :uid          => params[:uid],
    :title        => scn['title'],
    :description  => scn['description'],
    :side_a       => scn['side_a'],
    :side_b       => scn['side_b']
  )

  scn['articles'].each do |article|
     scenario.articles << Article.create(
       :pdf_filename => article['pdf_filename'],
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
    body scenario.first.to_json(:methods => [:articles])
  end
end

delete '/screnario/:uid' do

end

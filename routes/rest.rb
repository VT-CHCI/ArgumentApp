# Update Fields
post '/scenario/:uid' do
end

put '/scenario/:uid' do
  scn = JSON request.body.read

  side_a = Stack.create(:description => scn['side_a']['description'])
  side_b = Stack.create(:description => scn['side_b']['description']) 

  ['side_a', 'side_b'].each do |side|
   scn[side]['articles'].each do |article|
     (side == 'side_a' ? side_a.articles : side_b.articles) << Article.create(
       :file        => article['file'],
       :title       => article['title'],
       :description => article['description']
     )
    end
  end

  scenario = Scenario.create(
    :title        => scn['title'],
    :description  => scn['description'],
    :uid          => params[:uid]
  )

  scenario.stacks << side_a
  scenario.stacks << side_b


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
    body scenario.to_json(:methods => [:stacks, :articles])
  end
end

delete '/screnario/:uid' do

end

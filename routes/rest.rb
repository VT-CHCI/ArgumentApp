post '/scenario/:uid' do
end

put '/scenario/:uid' do
  scn = JSON request.body.read

  scenario = Scenario.create(
    :title => scn['title'],
    :description => scn['description'],
    :uid => params[:uid]
  )

  scenario.save
  status 200 
  body scenario.id.to_s
end

get '/scenario/:uid' do
  scn = Scenario.all(:uid => params[:uid])
  if scn.nil? then
    status 404
  else
    status 200
    body scn.to_json
  end
end

delete '/screnario/:uid' do

end

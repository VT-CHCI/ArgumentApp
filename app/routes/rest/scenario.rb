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


put '/scenario/:uid/:file' do
  scenario = Scenario.all(:uid => params[:uid])
  puts "THE FILE"
  #puts params['file'][:tempfile].path
  if scenario.nil? then
    status 404
  else
    status 200
    upload_directory = "#{settings.root}/data/scenarios/#{params[:uid]}/"
    FileUtils.mkdir_p(upload_directory) unless File.exists?(upload_directory)
    File.open("#{upload_directory}/#{params[:file]}", 'w+') do |file|
      file.write request.body.read
      status 200
    end
  end
end

get '/scenario/:uid/:file' do
  file_path = "#{settings.root}/data/scenarios/#{params[:uid]}/#{params[:file]}"

  send_file file_path, :filename => params[:file], :type => 'application/pdf'
end

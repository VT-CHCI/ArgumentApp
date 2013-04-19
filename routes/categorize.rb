get '/categorize' do
  locals = get_scenario
  haml :categorize, :locals => locals
end

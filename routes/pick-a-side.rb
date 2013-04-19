get '/' do
  haml :pick_a_side, 
    :locals => get_scenario
end

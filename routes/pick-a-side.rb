def get_scenario
  require 'yaml'
  YAML::load(
    File.open(
      'scenarios/industrialists.yaml'
    )
  )
end

get '/' do

  haml :pick_a_side, 
    :locals => get_scenario
end

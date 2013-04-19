def get_scenario
  require 'yaml'
  YAML::load(
    File.open(
      'scenarios/industrialists.yaml'
    )
  )
end

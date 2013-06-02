#!/usr/bin/env ruby
require 'json'
require 'haml'

require 'sinatra'
require 'sinatra/partial'

require 'data_mapper'
require 'dm-serializer'
require 'digest'

set :views => "#{settings.root}/app/views/templates",
  :public_folder => "#{settings.root}/app/views/public",
  :static => true,
  :sessions => true


DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "sqlite://#{settings.root}/data/argue.db")
DataMapper::Model.raise_on_save_failure = true
Dir["#{settings.root}/app/models/*.rb"].each {|model| require model }
DataMapper.auto_upgrade!

Dir["#{settings.root}/app/common/*.rb"].each { |helper| require helper }

before do
  @user = logged_in_as
end

["auth.rb", "static.rb", "rest/scenario.rb", "rest/user.rb"].each do |route|
  require "#{settings.root}/app/routes/#{route}"
end

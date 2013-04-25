#!/usr/bin/env ruby
require 'json'
require 'haml'

require 'sinatra'
require 'sinatra/partial'

require 'data_mapper'
require 'dm-serializer'
require 'digest'

set :views => "#{settings.root}/views",
  :public_folder => "#{settings.root}/public/",
  :static => true,
  :sessions => true


DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "sqlite://#{Dir.pwd}/argue.db")
DataMapper::Model.raise_on_save_failure = true
Dir["./models/*.rb"].each {|model| require model }
DataMapper.auto_upgrade!

Dir["./common/*.rb"].each { |helper| require helper }

require './routes/static.rb'
require './routes/scenario.rb'


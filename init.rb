#!/usr/bin/env ruby
require 'sinatra'
require 'sinatra/partial'
require 'json'
require 'data_mapper'
require 'digest'

set :views => "#{settings.root}/views",
  :public_folder => "#{settings.root}/public/",
  :static => true,
  :sessions => true

Dir["./helpers/*.rb"].each { |helper| require helper }

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "sqlite://#{Dir.pwd}/argue.db")
DataMapper::Model.raise_on_save_failure = true
Dir["./models/*.rb"].each {|model| require model }
DataMapper.auto_upgrade!

require './routes/pick-a-side.rb'
require './routes/categorize.rb'
require './routes/pdf_view.rb'

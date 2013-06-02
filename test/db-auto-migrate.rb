#!/usr/bin/env ruby
require 'data_mapper'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "sqlite://#{Dir.pwd}/../argue.db")
DataMapper::Model.raise_on_save_failure = true

Dir["../models/*.rb"].each {|model| require model }

DataMapper.auto_migrate!

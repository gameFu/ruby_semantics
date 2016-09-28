Dir["./operations/*.rb"].each {|file| require file }
Dir["./datatypes/*.rb"].each {|file| require file }
Dir["./sentence/*.rb"].each {|file| require file }
require "pry"
require_relative './machine.rb'
require_relative './variable.rb'

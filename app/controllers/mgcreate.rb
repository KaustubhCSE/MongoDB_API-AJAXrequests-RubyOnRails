# Name: Kaustubh Mohgaonkar
# ID: 1001101770
# Net ID : kpm1770

# Refrences: 
# 1. http://stackoverflow.com/questions/5410682/parsing-a-json-string-in-ruby
# 2. https://docs.mongodb.org/manual/tutorial/getting-started-with-the-mongo-shell/
# 3. https://github.com/mongodb/mongo-ruby-driver/wiki/Tutorial

# Script to Create Mongo Database and Insert Data.

require 'rubygems'
require 'json'
require 'mongo'
require 'open-uri'
include Mongo

# puts Gem.loaded_specs["mongo"].version
db = Mongo::Client.new(['ds027155.mongolab.com:27155'],:database => 'heroku_bvdcj6j3',:user => 'admin', :password => 'admin')
# db = Mongo::Client.new(['127.0.0.1:27017'],:database => 'test')

# Create a new collection fathers.
coll = db["fathers"]

data_hash = JSON.parse(open("http://json-generator.appspot.com/api/json/get/bVSYVXYLCa?indent=2").read)

    for data in data_hash['fathers']

    	coll.insert_one({ID: data['id'], Married: data['married'], Name: data['name'], Son: data['son'], Daughter: data['daughter'] })

  	end

puts "Data inserted"

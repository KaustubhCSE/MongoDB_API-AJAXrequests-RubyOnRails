# Name: Kaustubh Mohgaonkar
# ID: 1001101770
# Net ID : kpm1770

# Refrences: 
# 1. http://stackoverflow.com/questions/5410682/parsing-a-json-string-in-ruby
# 2. https://docs.mongodb.org/manual/tutorial/getting-started-with-the-mongo-shell/
# 3. https://github.com/mongodb/mongo-ruby-driver/wiki/Tutorial

# Script which uses primary key to query database

require 'rubygems'
require 'json'
require 'mongo'
include Mongo


def query
# puts Gem.loaded_specs["mongo"].version
# Use for local mongo db connection.
db = Mongo::Client.new(['127.0.0.1:27017'],:database => 'test')

# Use for Heroku Mongo connection.
# db = Mongo::Client.new(['ds037990.mongolab.com:37990'],:database => 'heroku_c0c04lxx',:user => 'admin', :password => 'admin');

coll = db["fathers"]

tempID = ARGV[0]
puts tempID

findID = tempID.to_i

coll.find("ID" => 1).each do | document |
	#puts JSON.parse(document.to_s)
	doc_json = JSON.parse(document.to_json)
	@result = doc_json
	puts @result
	# puts doc_json.class
end

end

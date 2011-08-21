require 'rubygems'
require 'rspec'
require 'yajl'

require 'unified_db'
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

# This is secret is for testing purposes
# PLEASE don't copy and reuse it :)
UnifiedDB.tvdb_secret = '7ED5C5E4CAFAF90E'

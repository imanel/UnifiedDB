require 'rubygems'
require 'rspec'
require 'yajl'

require 'unified_db'
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

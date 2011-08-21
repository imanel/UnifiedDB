require 'crack/json'
require 'yajl'

module Crack
  class JSON
    def self.parse(json)
      Yajl::Parser.parse(json)
    end
  end
end

module Crack
  class JSON
    def self.parse(json)
      ActiveSupport::JSON.decode(json)
    end
  end
end
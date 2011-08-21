module Result
  class Title < Base
    
    def self.allowed_keys
      [ :id, :title, :year ]
    end
        
  end
end

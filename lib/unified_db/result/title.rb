module UnifiedDB
  module Result
    class Title < Base
      
      def self.allowed_keys
        [ :id, :title, :year ]
      end
      
      attr_reader *allowed_keys
      
    end
  end
end

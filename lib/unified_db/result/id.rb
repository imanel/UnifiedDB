module UnifiedDB
  module Result
    class ID < Base
      
      def self.allowed_keys
        [ :id, :title, :overview, :release_date, :genres, :rating, :runtime, :actors, :directors, :writers, :posters ]
      end
      
      attr_reader *allowed_keys
      
    end
  end
end

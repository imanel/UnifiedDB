module UnifiedDB
  module Result
    class Base
    
      def self.allowed_keys; []; end
        
      attr_reader *allowed_keys
    
      def initialize(params)
        allowed_keys.each do |key|
          instance_variable_set("@#{key}", params[key])
        end
      end
    
      def to_h
        allowed_keys.inject({}) { |hash, key| hash[key] = instance_variable_get("@#{key}"); hash }
      end
      
      def to_json(*args)
        UnifiedDB.json_encoder.encode to_h
      end
    
      private
    
      def allowed_keys
        self.class.allowed_keys
      end
        
    end
  end
end

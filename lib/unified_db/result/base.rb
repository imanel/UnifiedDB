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
    
      def as_json(*args)
        allowed_keys.inject({}) { |hash, key| hash[key] = instance_variable_get("@#{key}"); hash }
      end
    
      private
    
      def allowed_keys
        self.class.allowed_keys
      end
        
    end
  end
end

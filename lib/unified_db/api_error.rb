module UnifiedDB
  class ApiError < RuntimeError
  
    def to_h
      {
        :result => 'error',
        :reason => message
      }
    end
    
    def to_json(*args)
      UnifiedDB.json_encoder.encode to_h
    end
  
  end
end

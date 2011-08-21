module UnifiedDB
  class ApiError < RuntimeError
  
    def as_json(*args)
      {
        :result => 'error',
        :reason => message
      }
    end
  
  end
end

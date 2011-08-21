class ApiError < RuntimeError
  
  def to_json(*args)
    {
      :result => 'error',
      :reason => message
    }.to_json
  end
  
end
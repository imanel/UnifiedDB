class ApiController < ApplicationController
  
  def show
    raise ApiError, 'no backend specified' unless params[:b]
    
    backend = Backend.select(params[:b])
    raise ApiError, 'unknown backend' unless backend
    
    result = backend.find(params)
    
    render :json => result
  rescue ApiError => e
    render :status => 400, :json => e
  end
  
end

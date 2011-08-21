module Backend
  class Base
    
    attr_accessor :id, :title
    
    def self.find(params)
      new.find(params)
    end
    
    def initialize
      @result = []
    end
    
    def find(params)
      if params[:id]
        find_by_id params[:id]
      elsif params[:t]
        find_by_title params[:t]
      else
        raise ApiError, 'no search criteria specified'
      end
      
      result
    end
    
    def find_by_id(id)
      raise ApiError, 'not implemented'
    end
    
    def find_by_title(title)
      raise ApiError, 'not implemented'
    end
    
    def result
      {
        :status => 'success',
        :service => service,
        :result => @result
      }
    end
    
    private
    
    def service; 'base'; end
    
  end
end
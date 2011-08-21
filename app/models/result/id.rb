module Result
  class ID < Base
    attr_reader :id, :title
    
    def initialize(params)
      @id = params[:id]
      @title = params[:title]
    end
    
    def to_json(*args)
      {
        :id => @id,
        :title => @title
      }
    end
    
  end
end

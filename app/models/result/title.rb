module Result
  class Title < Base
    attr_reader :id, :title, :year
    
    def initialize(params)
      @id = params[:id]
      @title = params[:title]
      @year = params[:year]
    end
    
    def to_json(*args)
      {
        :id => @id,
        :title => @title,
        :year => @year
      }
    end
    
  end
end

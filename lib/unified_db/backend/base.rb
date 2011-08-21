module UnifiedDB
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
        elsif params[:t] || params[:title]
          find_by_title(params[:t] || params[:title])
        else
          raise ApiError, 'no search criteria specified'
        end
      
        result
      rescue ApiError => e
        {
          :status => 'error',
          :reason => e.message
        }
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
    
      def format_actors(actors)
        Array(actors).collect { |a| { a.name => a.role } }
      end
    
      def format_directors(directors)
        Array(directors).collect(&:name)
      end
    
      def format_writers(writers)
        Array(writers).collect(&:name)
      end
    
    end
  end
end

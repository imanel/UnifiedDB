require 'imdb_party'

module UnifiedDB
  module Backend
    class IMDB < Base
    
      def find_by_id(id)
        movie = handler.find_movie_by_id(id)
        @result = Result::ID.new(
          :id => movie.imdb_id,
          :title => movie.title,
          :overview => movie.plot,
          :release_date => movie.release_date,
          :genres => movie.genres,
          :rating => movie.rating,
          :runtime => movie.runtime.to_i,
          :actors => format_actors(movie.actors),
          :directors => format_directors(movie.directors),
          :writers => format_writers(movie.writers),
          :posters => Array(movie.poster_url)
        )
      rescue
        raise ApiError, 'not found'
      end
    
      def find_by_title(title)
        movies = handler.find_by_title(title)
        movies.each do |movie|
          @result << Result::Title.new(
            :id => movie[:imdb_id],
            :title => movie[:title],
            :year => movie[:year])
        end
      end
    
      private
    
      def service; 'imdb'; end
    
      def handler
        @handler ||= ImdbParty::Imdb.new(:anonymize => true)
      end
    
    end
  end
end

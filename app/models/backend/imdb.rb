module Backend
  class IMDB < Base
    
    def find_by_id(id)
      movie = handler.find_movie_by_id(id)
      @result = Result::ID.new(
        :id => movie.imdb_id,
        :title => movie.title,
        :directors => movie.directors,
        :writers => movie.writers,
        :tagline => movie.tagline,
        :company => movie.company,
        :plot => movie.plot,
        :runtime => movie.runtime,
        :rating => movie.rating,
        :poster_url => movie.poster_url,
        :release_date => movie.release_date,
        :certification => movie.certification,
        :genres => movie.genres,
        :actors => movie.actors
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
    rescue
      railse ApiError, 'not found'
    end
    
    private
    
    def service; 'imdb'; end
    
    def handler
      @handler ||= ImdbParty::Imdb.new(:anonymize => true)
    end
    
  end
end
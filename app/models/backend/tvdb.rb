module Backend
  class TVDB < Base
    
    def find_by_id(id)
      movie = handler.get_series_by_id(id)
      @result = Result::ID.new(
        :id => movie.id,
        :title => movie.name,
        :overview => movie.overview,
        :release_date => movie.first_aired.to_s,
        :genres => movie.genres,
        :rating => movie.rating,
        :runtime => movie.runtime.to_i,
        :actors => format_actors(movie.actors),
        :directors => [],
        :writers => [],
        :posters => format_posters(movie.banners)
      )
    # rescue
    #   raise ApiError, 'not found'
    end
    
    def find_by_title(title)
      movies = handler.search(title)
      movies.each do |movie|
        @result << Result::Title.new(
          :id => movie['seriesid'],
          :title => movie['SeriesName'],
          :year => movie['FirstAired'].to_s.split('-')[0])
      end
    end
    
    private
    
    def service; 'tvdb'; end
    
    def handler
      @handler ||= TvdbParty::Search.new(ENV['TVDB_KEY'])
    end
        
    def format_posters(posters)
      posters.select{|poster| poster.banner_type == 'season'}.collect(&:url)
    end
    
  end
end
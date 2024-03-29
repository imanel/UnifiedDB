require 'imdb'
require 'imdb_party'

module UnifiedDB
  module Backend
    class IMDB < Base

      def find_by_id(id)
        movie = handler.find_movie_by_id(id)
        @result = Result::ID.new(
          :id => movie.imdb_id,
          :title => movie.title.to_s,
          :overview => movie.plot.to_s,
          :release_date => movie.release_date.to_s,
          :genres => movie.genres,
          :rating => movie.rating.to_s,
          :runtime => movie.runtime.to_i.to_s,
          :actors => format_actors(movie.actors),
          :directors => format_directors(movie.directors),
          :writers => format_writers(movie.writers),
          :posters => Array(movie.poster_url)
        )
      rescue
        raise ApiError, 'not found'
      end

      def find_by_title(title)
        # movies = handler.find_by_title(title)
        movies = Imdb::Search.new(title).movies
        movies.each do |movie|
          id = "tt#{movie.id}"
          title = movie.title
          title = title.encode('iso-8859-1').force_encoding('utf-8') if title.respond_to? :force_encoding
          title1, year, tmp, title2 = title.match(/(.*) \(([0-9]{4})(\/[a-zA-Z]*)?\)(.*)/)[1..4] rescue next
          @result << Result::Title.new(
            :id => id,
            :title => [title1.to_s.strip, title2.to_s.strip].join(" ").strip,
            :year => year)
        end
        result
      end

      private

      def service; 'imdb'; end

      def handler
        @handler ||= ImdbParty::Imdb.new(:anonymize => true)
      end

    end
  end
end

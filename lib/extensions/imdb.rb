require 'imdb'

module Imdb
  class Search < MovieList

    def parse_movie
      id                 = document.at("head/link[@rel='canonical']")['href'][/\d+/]
      title              = document.at("h1").innerHTML.imdb_strip_tags.gsub("\n", " ").strip.imdb_unescape_html
      [Imdb::Movie.new(id, title)]
    end
  end
end

require 'imdb'

module Imdb
  class Search < MovieList

    def self.query(query)
      open("http://anonymouse.org/cgi-bin/anon-www.cgi/http://akas.imdb.com/find?q=#{CGI::escape(query)}&s=tt")
    end

    def parse_movie
      id                 = document.at("head/link[@rel='canonical']")['href'][/\d+/]
      title              = document.at("h1").innerHTML.imdb_strip_tags.gsub("\n", " ").strip.imdb_unescape_html
      [Imdb::Movie.new(id, title)]
    end

    def parse_movies
      document.search("a[@href^='http://anonymouse.org/cgi-bin/anon-www.cgi/http://akas.imdb.com/title/tt']").each do |pm|
        pm["href"] = pm["href"].gsub("http://anonymouse.org/cgi-bin/anon-www.cgi/http://akas.imdb.com", "")
      end
      super
    end

  end
end

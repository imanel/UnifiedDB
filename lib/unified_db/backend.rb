module UnifiedDB
  module Backend
    
    autoload :Base, "#{ROOT}/unified_db/backend/base"
    autoload :IMDB, "#{ROOT}/unified_db/backend/imdb"
    autoload :TVDB, "#{ROOT}/unified_db/backend/tvdb"
    
    AVAILABLE = {
      'imdb' => Backend::IMDB,
      'tvdb' => Backend::TVDB
    }

    def self.select(name)
      AVAILABLE[name.to_s]
    end
    
  end
end

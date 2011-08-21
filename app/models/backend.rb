module Backend
  
  AVAILABLE = {
    'imdb' => Backend::IMDB,
    'tvdb' => Backend::TVDB
  }
  
  def self.select(name)
    AVAILABLE[name.to_s]
  end
  
end
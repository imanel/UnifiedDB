module Backend
  
  AVAILABLE = {
    'imdb' => Backend::IMDB
  }
  
  def self.select(name)
    AVAILABLE[name.to_s]
  end
  
end
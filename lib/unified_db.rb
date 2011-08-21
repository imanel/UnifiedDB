module UnifiedDB
  
  ROOT = File.expand_path(File.dirname(__FILE__))

  autoload :ApiError, "#{ROOT}/unified_db/api_error"
  autoload :Backend,  "#{ROOT}/unified_db/backend"
  autoload :Result,   "#{ROOT}/unified_db/result"
  autoload :Version,  "#{ROOT}/unified_db/version"
  
  class << self
    attr_accessor :json_encoder, :tvdb_secret
    
    def json_encoder
      @json_encoder ||= Yajl::Encoder.new
    end
  end
end

require "#{UnifiedDB::ROOT}/ext/crack"

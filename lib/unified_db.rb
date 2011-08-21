module UnifiedDB
  ROOT = File.expand_path(File.dirname(__FILE__))

  autoload :ApiError, "#{ROOT}/unified_db/api_error"
  autoload :Backend,  "#{ROOT}/unified_db/backend"
  autoload :Result,   "#{ROOT}/unified_db/result"
  autoload :Version,  "#{ROOT}/unified_db/version"
end

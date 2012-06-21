# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "unified_db/version"

Gem::Specification.new do |s|
  s.name        = "unified_db"
  s.version     = UnifiedDB::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Bernard Potocki"]
  s.email       = ["bernard.potocki@imanel.org"]
  s.homepage    = "http://github.com/imanel/unifieddb"
  s.summary     = %q{Scrapper for multiple Movie Databases}
  s.description = %q{Scrapper for multiple Movie Databases}

  s.add_dependency 'yajl-ruby'
  s.add_dependency 'imdb', '~> 0.6.8'
  s.add_dependency 'httparty', '0.8.1'
  s.add_dependency 'imdb_party', '0.6.1'
  s.add_dependency 'tvdb_party', '0.6.2'
  s.add_development_dependency 'rspec', '~> 2.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

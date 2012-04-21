# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tavern/redis/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Darcy Laycock"]
  gem.email         = ["sutto@sutto.net"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "tavern-redis"
  gem.require_paths = ["lib"]
  gem.version       = Tavern::Redis::VERSION


  gem.add_dependency 'redis'
  gem.add_dependency 'redis-namespace'
  gem.add_dependency 'tavern'
  gem.add_dependency 'multi_json'
end

# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cld/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alessandro Dal Grande", "Jason Toy", "Juned Shaikh"]
  gem.email         = ["juned1234all@gmail.com"]
  gem.description   = %q{Compact Language Detection for Ruby}
  gem.summary       = %q{Compact Language Detection for Ruby}
  gem.homepage      = "https://github.com/justjuned/cld2-small"

  # gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = Dir["ext/**/*", "lib/**/*"]
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.extensions    = ["ext/cld/extconf.rb"]
  gem.name          = "cld2"
  gem.require_paths = ["lib"]
  gem.version       = CLD::VERSION

  gem.add_dependency "ffi", "1.12.0"

  gem.add_development_dependency "rspec", "~> 2.14.1"
end

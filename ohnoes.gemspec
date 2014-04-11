# -*- encoding: utf-8 -*-

require File.expand_path('../lib/ohnoes/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "ohnoes"
  gem.version       = Ohnoes::VERSION
  gem.summary       = %q{Abstraction Layer for catching exceptions}
  gem.description   = %q{TODO: Description}
  gem.license       = "MIT"
  gem.authors       = ["Marten Veldthuis"]
  gem.email         = "marten@veldthuis.com"
  gem.homepage      = "https://github.com/marten/ohnoes#readme"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'rails', '>= 3.1'

  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rdoc', '~> 3.0'
  gem.add_development_dependency 'rspec', '~> 3.0.0.beta1'
end

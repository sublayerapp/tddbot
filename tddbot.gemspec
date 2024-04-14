require_relative "lib/tddbot/version"

Gem::Specification.new do |spec|
  spec.name        = 'tddbot'
  spec.version     = Tddbot::VERSION
  spec.authors     = ['Scott Werner']
  spec.email       = ['scott@sublayer.com']
  spec.homepage    = 'https://www.sublayer.com'
  spec.summary     = 'A bot that pairs with you and writes code to pass your tests'
  spec.description = 'Pair with an LLM by writing tests, leting them fail, and having an LLM write the code to pass the tests.'
  spec.license     = 'MIT'

  spec.files       = `git ls-files`.split("\n")
  spec.bindir      = 'exe'
  spec.executables << 'tddbot'
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 3'

  spec.add_dependency 'cli-kit', '~> 5'
  spec.add_dependency 'cli-ui', '~> 2.2.3'
  spec.add_dependency 'sublayer', '>= 0.0.6'
end

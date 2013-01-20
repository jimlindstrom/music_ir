# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'music_ir/version'

Gem::Specification.new do |gem|
  gem.name          = "music_ir"
  gem.version       = MusicIR::VERSION
  gem.authors       = ["Jim Lindstrom"]
  gem.email         = ["jim.lindstrom@gmail.com"]
  gem.description   = %q{Detect phrases and meter. Model a corpus in terms markov chains for each dimension (pitch intervals, durations, pitch class intervals, etc).}
  gem.summary       = %q{Music Information Retrieval package for ruby}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
  gem.add_dependency "rake"
  gem.add_dependency "markov", "0.0.3"
end

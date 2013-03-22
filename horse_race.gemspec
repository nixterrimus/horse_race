# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'horse_race/version'

Gem::Specification.new do |spec|
  spec.name          = "horse_race"
  spec.version       = HorseRace::VERSION
  spec.authors       = ["Nick Rowe"]
  spec.email         = ["nixterrimus@dcxn.com"]
  spec.description   = %q{A horse race problem}
  spec.summary       = %q{A crooked bookie will let you run the horses.  How many times should you run them to know which are the top performers?}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "factory_girl"
  spec.add_development_dependency "pry"

  spec.add_runtime_dependency "highline"
end

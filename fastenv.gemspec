# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastenv/version'

Gem::Specification.new do |spec|
  spec.name          = "fastenv"
  spec.version       = Fastenv::VERSION
  spec.authors       = ["Kyle Tolle"]
  spec.email         = ["kyle@nullsix.com"]
  spec.summary       = %q{Fast access to environment variables.}
  spec.description   = %q{Takes advantage of method_missing to give you fast access to environment variables.}
  spec.homepage      = "https://github.com/kyletolle/fastenv"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end

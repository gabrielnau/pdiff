# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pdiff/version'

Gem::Specification.new do |spec|
  spec.name          = "pdiff"
  spec.version       = Pdiff::VERSION
  spec.authors       = ["Gabriel Nau"]
  spec.email         = ["gabriel.nau@gmail.com"]
  spec.description   = "Image diff"
  spec.summary       = "Image diff"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "subexec"
  spec.add_development_dependency "pry"
end

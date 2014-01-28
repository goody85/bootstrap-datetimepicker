# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bootstrap/datetimepicker/version'

Gem::Specification.new do |spec|
  spec.name          = "bootstrap-datetimepicker"
  spec.version       = Bootstrap::DateTimePicker::VERSION
  spec.authors       = ["Pierrick Rouxel"]
  spec.summary       = %q{Date/time picker widget for Twitter Bootstrap v3 (from Eonasdan)}
  spec.homepage      = "https://github.com/pierrickrouxel/bootstrap-datetimepicker"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "git"
end

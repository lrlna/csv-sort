# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'csv_sort/version'

Gem::Specification.new do |spec|
  spec.name          = "csv_sort"
  spec.version       = CsvSort::VERSION
  spec.authors       = ["Irina Shestak"]
  spec.email         = ["shestak.irina@gmail.com"]
  spec.summary       = %q{A gem to sort through csv file searching for invalid emails}
  spec.description   = %q{Outputs two json files: one with correct emails, another with invalid}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["csv_sort"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "smarter_csv"
  spec.add_dependency "trollop"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'socialmedia/version'

Gem::Specification.new do |spec|
  spec.add_dependency 'koala'
  spec.add_dependency 'twitter'
  spec.add_dependency 'linkedin'
  spec.add_dependency 'rest-client'
  spec.add_dependency 'google-api-client'
  spec.add_dependency 'legato'
  spec.add_dependency 'oauth2'
  spec.name          = "socialmedia"
  spec.version       = Socialmedia::VERSION
  spec.authors       = ["te"]
  spec.email         = ["te@gmail.com"]
  spec.summary       = "Posting to social media"
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = %w(LICENSE.txt README.md socialmedia.gemspec) + Dir['lib/**/*.rb']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

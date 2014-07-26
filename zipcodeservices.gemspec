# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "zipcodeservices/version"

Gem::Specification.new do |s|
  s.name        = 'zipcodeservices'
  s.version     = ZipCodeServices::VERSION 
  s.platform    = Gem::Platform::RUBY
  s.date        = '2014-05-06'
  s.summary     = "zipcodeservices for zipcodeservices.com"
  s.description = "Ruby Client for zipcodeservices.com.  Gives ip address and radius queries.  Visit zipcodeservices.com for more details"
  s.authors     = ["W Watson", "T Carpenter"]
  s.email       = 'wolfpack@vulk.com'
  s.files       = ["lib/zipcodeservices.rb"]
  s.homepage    = 'http://rubygems.org/gems/zipcodeservices'
  s.license       = 'MIT'
  s.required_ruby_version = '>= 1.9.3'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rspec', ["~> 2.13"]
  s.add_development_dependency 'vcr',["~> 2.4"]
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'debugger'

  s.add_runtime_dependency "typhoeus", "0.3.3"
  s.add_runtime_dependency "multi_xml"
  s.add_runtime_dependency "nokogiri"
end

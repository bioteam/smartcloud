# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "smartcloud/version"

Gem::Specification.new do |s|
  s.name        = "smartcloud"
  s.version     = Smartcloud::VERSION
  s.authors     = ["Adam Kraut"]
  s.email       = ["adam@bioteam.net"]
  s.summary     = %q{Ruby library for IBM SmartCloud Enterprise}
  s.description = %q{This gem provides classes representing SmartCloud resources}

  s.rubyforge_project = "smartcloud"
  
  s.add_runtime_dependency "json"
  s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "hashie"

  s.add_development_dependency "rspec"
  s.add_development_dependency "bundler"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

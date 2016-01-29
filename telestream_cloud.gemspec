# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "telestream_cloud/version"

Gem::Specification.new do |s|
  s.name        = "telestream_cloud"
  s.version     = TelestreamCloud::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Telestream Cloud"]
  s.email       = ["cloudsupport@telestream.net"]
  s.homepage    = "http://github.com/pandastream/panda_gem"
  s.summary     = %q{Telestream Cloud Client}
  s.description = %q{Telestream Cloud Client}

  s.add_dependency "ruby-hmac", ">= 0.3.2"
  s.add_dependency "faraday", ">= 0.7.0"
  s.add_dependency "multi_json", ">= 1.2.0"

  s.add_development_dependency "rake"
  s.add_development_dependency "timecop"
  s.add_development_dependency "rspec", ">= 2.8.0"
  s.add_development_dependency "webmock", ">= 1.8.2"
  
  s.rubyforge_project = "telestream_cloud"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

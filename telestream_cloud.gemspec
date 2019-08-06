# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "telestream_cloud/version"

Gem::Specification.new do |s|
  s.name        = "telestream_cloud"
  s.version     = TelestreamCloud::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Telestream Cloud"]
  s.email       = ["cloudsupport@telestream.net"]
  s.homepage    = "https://github.com/Telestream/telestream-cloud-ruby-sdk"
  s.summary     = %q{Telestream Cloud SDK}
  s.description = %q{Telestream Cloud SDK}

  # s.add_dependency "telestream_cloud_flip", "2.0.0"
  # s.add_dependency "telestream_cloud_tts", "2.0.0"
  # s.add_dependency "telestream_cloud_qc", "2.0.0"

  s.rubyforge_project = "telestream_cloud"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = []
  s.executables   = []
  s.require_paths = ["lib"]
end

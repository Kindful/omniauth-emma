# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/emma/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-emma'
  s.version  = OmniAuth::Emma::VERSION
  s.authors  = ['Ty DeLong']
  s.email    = ['ty@kindful.com']
  s.summary  = 'Emma strategy for OmniAuth'
  s.homepage = 'https://github.com/Kindful/omniauth-emma'
  s.license = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.1.1'

  s.add_development_dependency 'rspec', '~> 2.7.0'
  s.add_development_dependency 'rake'
end

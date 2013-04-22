# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/gotowebinar/version'

Gem::Specification.new do |gem|
  gem.authors       = "Graham Randall"
  gem.email         = "grandall@normalmodes.com"
  gem.description   = %q{OmniAuth Oauth2 strategy for GoToWebinar.}
  gem.summary       = %q{OmniAuth Oauth2 strategy for GoToWebinar.}
  gem.homepage      = "https://github.com/grandall/omniauth-gotowebinar"
    
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-gotowebinar"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::GoToWebinar::VERSION

  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.1.1'

  gem.add_development_dependency 'rspec', '~> 2'
  gem.add_development_dependency 'rake'
end

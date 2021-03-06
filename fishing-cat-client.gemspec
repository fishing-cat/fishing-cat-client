# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fishing-cat/client/version'

Gem::Specification.new do |spec|
  spec.name          = 'fishing-cat-client'
  spec.version       = FishingCat::Client::VERSION
  spec.authors       = ['Masayuki Higashino']
  spec.email         = ['mh.on.web@gmail.com']
  spec.summary       = 'Open-Source Phishing Campaign Toolkit'
  spec.description   = 'Open-Source Phishing Campaign Toolkit'
  spec.homepage      = 'https://github.com/fishing-cat/fishing-cat-client'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_dependency 'thor', '~> 0.19'
  spec.add_dependency 'activesupport', '~> 5.0.1'
  spec.add_dependency 'actionmailer', '~> 5.0.1'
  spec.add_dependency 'hashids', '~> 1.0'
  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-nyan-cat'
end

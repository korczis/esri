# encoding: utf-8

require 'rubygems'

$:.push File.expand_path("../lib", __FILE__)

require 'esri/version.rb'

Gem::Specification.new do |s|
  s.name = 'esri'
  s.version = Esri::VERSION
  # s.platform = Gem::Platform::RUBY
  s.summary = 'ESRI Downloader'
  s.description = 'ESRI Data Downloader'
  s.authors = [
    'Tomas Korcak'
  ]
  s.email = 'korczis@gmail.com'

  s.homepage = 'https://github.com/korczis/ersi'
  s.license = 'MIT'
  s.require_paths = ['lib']

  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }

  s.add_dependency 'gli', '~> 2.11', '>= 2.11.0'
  s.add_dependency 'json_pure', '~> 1.8', '>= 1.8.1'
  s.add_dependency 'multi_json', '~> 1.10', '>= 1.10.1'
  s.add_dependency 'nokogiri', '~> 1.6', '>= 1.6.3'
  s.add_dependency 'pg', '~> 0.17', '>= 0.17.1'
  s.add_dependency 'pmap', '~> 1.0', '>= 1.0.1'
  s.add_dependency 'rake', '~> 10.3', '>= 10.3.2'
  s.add_dependency 'terminal-table', '~> 1.4', '>= 1.4.5'
  s.add_dependency 'zip', '~> 2.0', '>= 2.0.2'

  s.add_development_dependency 'coveralls', '~> 0.7', '>= 0.7.0r'
  s.add_development_dependency 'rspec', '~> 3.0', '>= 3.0.0'
  s.add_development_dependency 'rubocop', '~> 0.24', '>= 0.24.0'
  s.add_development_dependency 'simplecov', '~> 0.8', '>= 0.8.2'
end

# encoding: utf-8

require 'gli'

include GLI::App

require_relative '../../version'

require_relative '../../dataset/dataset.rb'

require_relative '../shared'

desc 'Dataset related operations'
command :dataset do |dataset|
  dataset.desc 'Links'
  dataset.command :links do |links|
    links.action do
      pp Esri::Dataset.fetch_links
    end
  end
end

# encoding: utf-8

require 'gli'

include GLI::App

require_relative '../../version'

require_relative '../../dataset/dataset.rb'

require_relative '../shared'

desc 'Dataset related operations'
command :dataset do |dataset|
  dataset.desc 'Download datasets'
  dataset.command :download do |download|
    download.action do
      puts Esri::Dataset.fetch_links
    end
  end

  dataset.desc 'Get datasets Links'
  dataset.command :links do |links|
    links.action do
      links = Esri::Dataset.fetch_links
      links.each do |row|
        puts row[:url]
      end

      Esri::Dataset.write_links(links)
    end
  end
end

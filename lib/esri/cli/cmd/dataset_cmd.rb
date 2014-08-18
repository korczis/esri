# encoding: utf-8

require 'gli'
require 'json'

include GLI::App

require_relative '../../core'
require_relative '../../version'

require_relative '../../dataset/dataset.rb'

require_relative '../shared'

desc 'Dataset related operations'
command :dataset do |dataset|
  dataset.desc 'Download datasets (from links)'
  dataset.command :download do |download|
    download.action do
      links = Esri::Dataset.fetch_links
      links.each do |row|
        puts row[:url]
      end

      Esri::Dataset.download_links(links)
    end
  end

  dataset.desc 'Import unpacked datasets'
  dataset.command :import do |import|
    import.action do
      puts 'Importing datasets'
    end
  end

  dataset.desc 'Info about datasets'
  dataset.command :info do |info|
    info.action do
      links = Esri::Dataset.fetch_links
      links.each do |row|
        puts JSON.pretty_generate(row)
      end

      Esri::Dataset.write_links(links)
    end
  end

  dataset.desc 'Get datasets links'
  dataset.command :links do |links|
    links.action do
      links = Esri::Dataset.fetch_links
      links.each do |row|
        puts row[:url]
      end

      Esri::Dataset.write_links(links)
    end
  end

  dataset.desc 'List local unpacked datasets'
  dataset.command :list do |list|
    list.action do
      datasets = Esri::Dataset.list_datasets
      puts datasets
    end
  end

  dataset.desc 'Unpack downloaded datasets'
  dataset.command :unpack do |unpack|
    unpack.action do
      datasets = Esri::Dataset.list_datasets
      Esri::Dataset.unpack_datasets(datasets)
    end
  end
end

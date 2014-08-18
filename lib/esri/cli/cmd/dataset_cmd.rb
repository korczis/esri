# encoding: utf-8

require 'gli'

include GLI::App

require_relative '../../core'
require_relative '../../version'

require_relative '../../dataset/dataset.rb'

require_relative '../shared'

desc 'Dataset related operations'
command :dataset do |dataset|
  dataset.desc 'Download datasets'
  dataset.command :download do |download|
    download.action do
      cmd = "aria2c -i #{Esri::LINK_FILE} -x 16 --dir=#{Esri::DATA_DIR}"
      system(cmd)
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

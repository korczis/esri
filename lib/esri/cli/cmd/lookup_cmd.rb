# encoding: utf-8

require 'gli'
require 'json'

include GLI::App

require_relative '../../core'
require_relative '../../version'

require_relative '../../dataset/dataset.rb'

require_relative '../shared'

desc 'Lookup'
command :lookup do |cmd|
  cmd.desc 'Lookup zip'
  cmd.command :zip do |zip|
    zip.action do |_global_options, _options, args|
      puts args.inspect
      lng = args[0] || -122.4246
      lat = args[1] || 37.80145

      puts "Looking up for ZIP code of lng=#{lng}, lat=#{lat}"
      Esri::Dataset.lookup_zip(lng, lat)
    end
  end
end

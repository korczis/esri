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
    zip.action do
      Esri::Dataset.lookup_zip
    end
  end
end

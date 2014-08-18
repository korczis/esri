# encoding: utf-8

require 'gli'
require 'json'

include GLI::App

require_relative '../../core'
require_relative '../../version'

require_relative '../../dataset/dataset.rb'

require_relative '../shared'

desc 'Database related operations'
command :database do |cmd|
  cmd.desc 'Import unpacked datasets'
  cmd.command :import do |import|
    import.action do
      Esri::Dataset.import_shapes
    end
  end
end

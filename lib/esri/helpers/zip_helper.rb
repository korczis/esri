# encoding: UTF-8

require 'fileutils'
require 'zip'

# ESRI module
module Esri
  # ESRI module helpers
  module Helpers
    # Zip archives helper
    module ZipHelper
      class << self
        def unzip_file(zip_file, dest_dir)
          zip_file.each do |f|
            f_path = File.join(dest_dir, f.name)
            puts "Extracting #{f_path}, #{f.size} Bytes"
            if File.exist?(f_path)
              puts "Deleting old #{f_path}"
              FileUtils.rm_rf f_path
            end
            zip_file.extract(f, f_path)
          end
        end

        def unzip_to(src, dest_dir)
          FileUtils.mkdir_p dest_dir
          Zip::ZipFile.open(src) do |zip_file|
            unzip_file(zip_file, dest_dir)
          end
        end
      end
    end
  end
end

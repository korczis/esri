# encoding: UTF-8

require 'fileutils'
require 'zip'

# ESRI module
module Esri
  module Helpers
    module ZipHelper
      class << self
        def unzip_to(src, dest_dir)
          # puts "Unziping #{src} to #{dest_dir}"

          FileUtils.mkdir_p dest_dir

          Zip::ZipFile.open(src) { |zip_file|
            zip_file.each { |f|
              f_path = File.join(dest_dir, f.name)
              puts "Extracting #{f_path}, #{f.size} Bytes"

              if File.exists?(f_path)
                puts "Deleting old #{f_path}"
                FileUtils.rm_rf f_path
              end

              zip_file.extract(f, f_path)
            }
          }
        end
      end
    end
  end
end

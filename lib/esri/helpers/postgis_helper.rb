# encoding: UTF-8

require 'multi_json'

require_relative '../core'

module Esri
  module Helpers
    # PostGIS helpers
    module PostgisHelper
      class << self
        def load_db_config
          {
            host: 'apollocrawler.com',
            username: 'datathon',
            password: 'datathon',
            database: 'datathon_v2'
          }
        end

        def import_shapes(shapes, opts = load_db_config)
          shapes.map do |shape|
            table_name = shape.split('/').last.gsub(/\.shp$/, '')
            puts "Importing shape file '#{shape}' as '#{table_name}'"

            shp2psql_cmd = "shp2pgsql -c #{shape} public.gis_esri_#{table_name}"
            psql_cmd = "psql -h apollocrawler.com -d datathon -U datathon"

            pswd = 'export  PGPASSWORD=datathon'
            cmd = "#{pswd} && #{shp2psql_cmd} | #{psql_cmd} > /dev/null"
            system cmd
          end
        end
      end
    end
  end
end

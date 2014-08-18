# encoding: UTF-8

require 'multi_json'

require_relative '../core'

module Esri
  module Helpers
    # PostGIS helpers
    module PostgisHelper
      PSQL_CMD = 'psql -h apollocrawler.com -d datathon -U datathon'

      class << self
        def load_db_config
          {
            host: 'apollocrawler.com',
            username: 'datathon',
            password: 'datathon',
            database: 'datathon_v2'
          }
        end

        def extract_table_name(shape)
          shape.split('/').last.gsub(/\.shp$/, '')
        end

        def index_shapes(shapes, _opts = load_db_config)
          puts 'Indexing shapes'
          shapes.map do |shape|
            table_name = extract_table_name(shape)
            index_name = "idx_gis_esri_#{table_name}_geom"
            full_table_name = "gis_esri_#{table_name}"
            query = "CREATE INDEX #{index_name} ON #{full_table_name} USING gist(geom);"
            puts query
            cmd = "echo \"#{query}\" | #{PSQL_CMD}"
            puts "Indexing shape #{table_name} using '#{cmd}'"
            system(cmd)
          end
        end

        def import_shapes(shapes, _opts = load_db_config)
          shapes.map do |shape|
            table_name = extract_table_name(shape)
            puts "Importing shape file '#{shape}' as '#{table_name}'"

            shp2psql_cmd = "shp2pgsql -c #{shape} public.gis_esri_#{table_name}"
            psql_cmd = PSQL_CMD

            pswd = 'export PGPASSWORD=datathon'
            cmd = "#{pswd} && #{shp2psql_cmd} | #{psql_cmd} > /dev/null"
            system cmd
          end
        end
      end
    end
  end
end

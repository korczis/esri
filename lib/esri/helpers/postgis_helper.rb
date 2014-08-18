# encoding: UTF-8

module Esri
  module Helpers
    # PostGIS helpers
    module PostgisHelper
      class << self
        def import_shapes(shapes)
          shapes.map do |shape|
            table_name = shape.split('/').last.gsub(/\.shp$/, '')
            puts "Importing shape file '#{shape}' as '#{table_name}'"

            shp2psql_cmd = "shp2pgsql -c #{shape} public.gis_esri_#{table_name}"
            psql_cmd = 'psql -h apollocrawler.com -v -d datathon -U datathon'

            pswd = 'PGPASSWORD=datathon'
            cmd = "#{pswd} && #{shp2psql_cmd} | #{psql_cmd} > /dev/null"
            system cmd
          end
        end
      end
    end
  end
end

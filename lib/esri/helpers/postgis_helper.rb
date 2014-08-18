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
            cmd = "shp2pgsql -c #{shape} public.#{table_name} | psql -h apollocrawler.com -v  -d datathon -U datathon > /dev/null"
            system cmd
          end
        end
      end
    end
  end
end

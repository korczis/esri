# encoding: UTF-8

require 'open-uri'
require 'pmap'
require 'pp'
require 'nokogiri'
require 'zip'

require_relative '../core'
require_relative '../helpers/postgis_helper'
require_relative '../helpers/zip_helper'

module Esri
  # Provider module
  module Dataset
    HOST = 'http://www.baruch.cuny.edu'
    BASE_URL = "#{HOST}/geoportal/data/esri"
    MAIN_PAGE = "#{BASE_URL}/esri_usa.htm"

    class << self
      def download_links(_links = fetch_links)
        cmd = "aria2c -i #{Esri::LINK_FILE} -x 16 --dir=#{Esri::TMP_DIR}"
        system(cmd)
      end

      def extract_link_href(href)
        href ? href['href'] : nil
      end

      def extract_link_text(href)
        href ? href.text : nil
      end

      def extract_links_data(row)
        href = row.css('td > a').first
        { name: row.css('td:nth-child(1)').text,
          features: row.css('td:nth-child(2)').text,
          type: row.css('td:nth-child(3)').text,
          year: row.css('td:nth-child(4)').text,
          link: extract_link_href(href),
          link_title: extract_link_text(href),
          url: "#{BASE_URL}/#{extract_link_href(href)}"
        }
      end

      def fetch_links(url = MAIN_PAGE)
        page = Nokogiri::HTML(open(url))
        data = page.css 'table.tabledata > tr'
        res = data.map do |row|
          res = extract_links_data(row)
          next if res[:link].nil?
          next unless res[:link].match(/\.zip$/)
          res
        end
        res.compact
      end

      def import_shapes(shapes = list_shapes)
        Helpers::PostgisHelper.import_shapes(shapes)
      end

      def index_datasets(shapes = list_shapes)
        Helpers::PostgisHelper.index_shapes(shapes)
      end

      def list_datasets(dir = TMP_DIR)
        Dir["#{dir}/*.zip"].map do |f|
          f
        end
      end

      def list_shapes(dir = TMP_DIR)
        Dir["#{dir}/**/*.shp"].map do |f|
          f
        end
      end

      def lookup_zip(lng, lat)
        Helpers::PostgisHelper.lookup_zip(lng, lat)
      end

      def unpack_datasets(datasets = list_datasets)
        puts 'Unpacking datasets'
        datasets.map do |ds|
          dest_dir = ds.split('/').last.gsub(/\.zip$/, '')
          Helpers::ZipHelper.unzip_to(ds, "#{File.join(TMP_DIR, dest_dir)}")
        end
      end

      def write_links(links = fetch_links, path = LINK_FILE)
        File.open(path, 'w') do |f|
          links.each do |row|
            f.puts row[:url]
          end
        end
      end
    end
  end
end

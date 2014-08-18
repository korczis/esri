# encoding: UTF-8

require 'open-uri'
require 'pmap'
require 'pp'
require 'nokogiri'

module Esri
  # Provider module
  module Dataset
    HOST = 'http://www.baruch.cuny.edu'
    BASE_URL = "#{HOST}/geoportal/data/esri"
    MAIN_PAGE = "#{BASE_URL}/esri_usa.htm"

    class << self
      def fetch_links
        puts MAIN_PAGE
        page = Nokogiri::HTML(open(MAIN_PAGE))

        data = page.css 'table.tabledata > tr > td > a'
        res = data.map do |row|
          href = row["href"]

          next if href.nil?
          next unless href.match(/\.zip$/)

          url = "#{BASE_URL}/#{href}"
        end

        res.compact
      end
    end
  end
end

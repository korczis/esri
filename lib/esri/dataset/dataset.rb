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

        data = page.css 'table.tabledata > tr'
        res = data.map do |row|
          name = row.css('td:nth-child(1)').text
          features = row.css('td:nth-child(2)').text
          type = row.css('td:nth-child(3)').text
          year = row.css('td:nth-child(4)').text
          link = row.css('td > a').first
          next if link.nil?

          href = link['href']
          if href.match(/\.zip$/)

            { :name => name,
              :features => features,
              :type => type,
              :year => year,
              :link => href,
              :url => "#{BASE_URL}/#{href}"
            }
          end
        end

        res.compact
      end
    end
  end
end

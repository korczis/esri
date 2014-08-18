# encoding: UTF-8

require 'open-uri'
require 'pmap'
require 'pp'
require 'nokogiri'

require_relative '../core'

module Esri
  # Provider module
  module Dataset
    HOST = 'http://www.baruch.cuny.edu'
    BASE_URL = "#{HOST}/geoportal/data/esri"
    MAIN_PAGE = "#{BASE_URL}/esri_usa.htm"

    class << self
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
          url: "#{BASE_URL}/#{extract_link_text(href)}"
        }
      end

      def fetch_links
        page = Nokogiri::HTML(open(MAIN_PAGE))

        data = page.css 'table.tabledata > tr'
        res = data.map do |row|
          res = extract_links_data(row)

          next if res[:link].nil?
          next unless res[:link].match(/\.zip$/)

          res
        end

        res.compact
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

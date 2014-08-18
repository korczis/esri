#! /usr/bin/env ruby

require 'rubygems'

require 'open-uri'
require 'pmap'
require 'pp'
require 'nokogiri'

# http://www.baruch.cuny.edu/geoportal/data/dataset/esri_usa.htm

HOST = 'http://www.baruch.cuny.edu'
BASE_URL = "#{HOST}/geoportal/data/dataset"
MAIN_PAGE = "#{BASE_URL}/esri_usa.htm"

def get_links
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

def download(links)
	links.pmap do |link|
		system("wget --directory-prefix=data #{link}")
	end
end


def main
	links = get_links
	puts links

	# download(links)
end

if __FILE__ == $PROGRAM_NAME
	main
end

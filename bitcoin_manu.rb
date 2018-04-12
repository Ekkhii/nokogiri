require 'nokogiri'
require 'httparty'
require 'byebug'
require 'open-uri'


def scraper 

	url = "https://coinmarketcap.com/all/views/all/"
	unparsed_pages = HTTParty.get(url)
	parsed_pages = Nokogiri::HTML(unparsed_pages)
	p lignes = parsed_pages.css('.currency-name').first
	
end

scraper

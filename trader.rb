require 'nokogiri'
require 'httparty'
require 'byebug'
require 'open-uri'
require 'timeout'


def scraper 

	url = "https://coinmarketcap.com/all/views/all/"
	unparsed_pages = HTTParty.get(url)
	parsed_pages = Nokogiri::HTML(unparsed_pages)
	lignes = parsed_pages.css('tr')
	
	
	
	lignes.each do |extract|

		resultat = {
			nom: extract.css('.currency-name-container').text, 
			prix: extract.css('.price').text,
		}
		puts resultat


	end

end

scraper
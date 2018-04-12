require 'nokogiri'
require 'open-uri'

def scraper 

	url = "https://coinmarketcap.com/all/views/all/"
	parsed_pages = Nokogiri::HTML(open(url))
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
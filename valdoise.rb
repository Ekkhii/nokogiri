# RECUPERER TOUS LES LIENS DE LA PAGE 
# ET LES STOCKER DANS UN HASH

require 'open-uri'
require 'nokogiri'


def get_all_the_urls_of_val_doise_townhalls
pages = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
links = pages.css(".lientxt")
hash = Hash.new

#premiere boucle qui sors les url de chaque ville
	links.each do |ville|
		url = "http://annuaire-des-mairies.com" + ville['href']
 		hash.merge!(name: url)
#deuxieme boucle qui sors les mails de chaque page
		ville.each do |mail|
			page = Nokogiri::HTML(open(url))
			mail = page.xpath('//td[contains(text(), "@")]').text
			hash.merge!(email: mail)
		end
 puts hash
	end
end

get_all_the_urls_of_val_doise_townhalls

require 'nokogiri'
require 'httparty'
require 'byebug'
require 'open-uri'


def scraper 

	url = "http://annuaire-des-mairies.com/"
	unparsed_pages = HTTParty.get(url)
	parsed_pages = Nokogiri::HTML(unparsed_pages)
	departements = parsed_pages.css('a.lientxt')
	departements_urls = Array.new
	villes_urls = Array.new

	departements.each do |extraction|
 
		extract_dept_urls = url + extraction.attributes["href"].value
		puts departements_urls << extract_dept_urls
	
	
	end


end

scraper


=begin
def get_all_the_urls_of_val_doise_townhalls
pages = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
links = pages.css(".lientxt")
hash = Hash.new

    links.each do |ville|
        url = "http://annuaire-des-mairies.com" + ville['href']
        hash.merge!(url: url)
        ville.each do |mail|
            page = Nokogiri::HTML(open(url))
            mail = page.xpath('//td[contains(text(), "@")]').text
            hash.merge!(email: mail)
        end
puts hash
    end
end

get_all_the_urls_of_val_doise_townhalls
=end
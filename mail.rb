require 'open-uri'
require 'nokogiri'

def get_the_email_of_a_townhal_from_its_webpage(url)

page = open(url)
content = page.read 
parsed_content = Nokogiri::HTML(content)

	puts parsed_content.xpath('//td[contains(text(), "@")]').text
end

get_the_email_of_a_townhal_from_its_webpage('http://annuaire-des-mairies.com/01/amberieu-en-bugey.html')
require 'nokogiri'
require 'open-uri'

def incubateur

pages = Nokogiri::HTML(open("http://www.cadre-dirigeant-magazine.com/entreprendre/liste-non-exhaustive-incubateurs-prives-publics-france/"))
links = pages.css("p")
hash = Hash.new


links.each do |infos|
	puts text = infos.children.text.split(',')

end

end


incubateur
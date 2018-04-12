require 'open-uri'
require 'nokogiri'

def trader_de_l_obscur(url)

pages = Nokogiri::HTML(open(url))

hash = Hash.new

crypto = pages.css("a.currency-name-container")
hash.merge!(Nom: crypto)

puts hash

end

trader_de_l_obscur('https://coinmarketcap.com/all/views/all/')
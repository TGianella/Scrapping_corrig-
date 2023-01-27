require 'nokogiri'
require 'open-uri'

@page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html")) 
# Oblgation du @ à la variable pour pouvoir l'appeller à l'interieur d'une méthode

def get_townhall_email(townhall_url)
    url_avernes = Nokogiri::HTML(URI.open(townhall_url))
    mail_avernes = url_avernes.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
    return mail_avernes
end

puts get_townhall_email("http://annuaire-des-mairies.com/95/avernes.html")
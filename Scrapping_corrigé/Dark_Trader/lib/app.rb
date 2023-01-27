require 'nokogiri'
require 'open-uri'

PAGE = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/")) 
# Oblgation du @ à la variable pour pouvoir l'appeller à l'interieur d'une méthode


def keys_name
    name_currency = PAGE.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--hide-sm cmc-table__cell--sort-by__symbol"]')
    # Insert les xpath ciblés de la page internet coinmarket dans la variable "name_currency" (ne pas oublier le @ de la variable globale "page"). Le @ devant class sert à pouvoir appliquer des attributs comme ".text". les // sont un peu comme les ".." de cd. Pour se déplacer dans les parents/enfants. Et "td" est probablement pour tabledata.
    name_currency_array = [] # Création d'un array "name_currency_array"
    name_currency.each do |element| # chacun des 20 "name_currency" va tourner sur autant de boucles "element"
        name_currency_array << element.text # L'array "name_currency_array" se fait remplir à chaque tour par le texte ".text" de "element", dont on supprime le signe $ avec ".delete"
    end
    #puts name_currency_array.length # Affiche combien ".length" de valeurs il y a dans l'array "name_currency_array"
    return name_currency_array
end 
# OU (tout peut être remplacé par la ligne juste en dessous:)
# name_currency_array  = page.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--hide-sm cmc-table__cell--sort-by__symbol"]').collect(&:text)


def values_money
    name_currency = PAGE.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]')
    # Insert les xpath ciblés de la page internet coinmarket dans la variable "name_currency" (ne pas oublier le @ de la variable globale "page"). Le @ devant class sert à pouvoir appliquer des attributs comme ".text". les // sont un peu comme les ".." de cd. Pour se déplacer dans les parents/enfants. Et "td" est probablement pour tabledata.
    name_currency_array = [] # Création d'un array "name_currency_array"
    name_currency.each do |element| # chacun des 20 "name_currency" va tourner sur autant de boucles "element"
        name_currency_array << element.text.delete('$') # L'array "name_currency_array" se fait remplir à chaque tour par le texte ".text" de "element", dont on supprime le signe $ avec ".delete"
    end
    #puts name_currency_array.length # Affiche combien ".length" de valeurs il y a dans l'array "name_currency_array"
    return name_currency_array
end


def crypto_hash
    #hash = keys_name.zip(values_money).to_h
  #return hash
    name_price_hash = Hash[keys_name.zip (values_money)]
    array_of_hashes = []
    name_price_hash.each do |key, value|
        array_of_hashes << {key => value}
    end
    #puts array_of_hashes
    return array_of_hashes
end

crypto_hash

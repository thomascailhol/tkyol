# scraping_etsy.rb
require "open-uri"
require "nokogiri"

def scraper
  puts "What are you searching on Etsy?"
  article = gets.chomp

  # 1. We get the HTML file thanks to open-uri
  file = open("https://www.etsy.com/search?q=#{article}")

  # 2. We build a Nokogiri document from this file
  doc = Nokogiri::HTML(file)
  # 3. We search every elements with class="card" in our HTML doc

  doc.search(".n-listing-card__info").map { |card| card.search(".card-meta-row").text.strip }.first(5)
    # 4. for each element found, we extract its title and print it
    

end
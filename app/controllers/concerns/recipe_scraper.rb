require 'open-uri'
require 'nokogiri'

module RecipeScraper
  def search_recipes(ingredients)
    ingredients.map {|i| i.strip}
    doc = Nokogiri::HTML(open("https://food52.com/recipes/search?q=#{ingredients.join('+')}")
    binding.pry
  end

  def scrape_recipe
  end
end

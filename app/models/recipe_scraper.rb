require 'open-uri'
require 'nokogiri'

class RecipeScraper
  # attr_accessor :recipe_url, :pic, :title
  attr_reader :url, :data

  def initialize(url)
    @url = url
  end

  def data
    @data ||= Nokogiri::HTML(open(url))
  end

  def recipe_url
    @url = data.css('.collectable-tile').css('h3').xpath('//div/a/@href').map do |u|
      u.text.strip
    end
    final = @url.select {|x| x.start_with?("/recipes/")}
    final.pop(5)
    final.shift(4)
    final
  end

  def pic
    data.css('div.photo-block').css('img').map do |u|
     u['src']
    end
  end

  def title
    data.css('div.photo-block').css('a.photo').css('img').map do |u|
     u['alt']
    end
  end

  def all_info
    data.css('.recipe').each do |index|
      @recipe = {
      :title =>
      index.css('h1')[0].text.strip!,
      :pic_url =>
      index.css('img').map{|i|i['src']}.first,
      :ingred =>
      index.css('.clearfix').css('ul.recipe-list').css('li').map {|i|i.text.gsub(/\s+/, ' ')}.join.strip!,
      :description =>
      index.css('.clearfix').css('ol').map {|i|i.text.gsub(/\s+/, ' ').strip!}.join
    }
    end
    @recipe
  end
end

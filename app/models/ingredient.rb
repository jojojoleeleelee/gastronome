class Ingredient < ActiveRecord::Base
  belongs_to :user
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  validates :name, presence: true

  def self.fav_ingredient
    Ingredient.group(:name).order('count_id DESC').limit(1).count(:id)
  end

  def self.top_three_favs
    Ingredient.group(:name).order('count_id DESC').limit(3).count(:id)
  end

  def find_recipe(search)
    # Recipe.where(:title incluedes search)
  end
end

class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :user, dependent: :destroy
  # accepts_nested_attributes_for :ingredients

  # def ing_attr=(ing_attr)
  #   ingr_attr.values.each do |ing|
  #     self.recipes.build(ing)
  #   end
  # end

  # def ingredients_by_frequency
  #   ingredients.sort_by{|ing| ing}
  # end
end

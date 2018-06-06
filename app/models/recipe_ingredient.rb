class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  validates_inclusion_of :category, in: Choices['category']

end

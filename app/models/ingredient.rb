class Ingredient < ActiveRecord::Base
  belongs_to :pantry
  belongs_to :user
  has_many :recipes
end

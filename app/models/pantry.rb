class Pantry < ActiveRecord::Base
  has_many :ingredients
  has_many :recipes, through: :ingredients
  belongs_to :user

end

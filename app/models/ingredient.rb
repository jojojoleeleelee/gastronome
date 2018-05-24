class Ingredient < ActiveRecord::Base
  belongs_to :user
  has_many :recipes
  validates :name, presence: true

end

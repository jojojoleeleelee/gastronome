class Recipe < ActiveRecord::Base
  has_many :ingredients
  belongs_to :users
end

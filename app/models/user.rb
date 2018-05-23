class User < ActiveRecord::Base
  has_many :recipes
  belongs_to :pantry
  has_many :ingredients
  has_secure_password

end

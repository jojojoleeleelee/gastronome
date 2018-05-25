class User < ActiveRecord::Base
  has_many :recipes
  has_many :ingredients
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  validates :email, presence: true
  accepts_nested_attributes_for :recipes
  has_secure_password

end

class User < ActiveRecord::Base
  has_many :recipes, dependent: :destroy
  has_many :ingredients
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  validates :email, presence: true
  has_secure_password

end

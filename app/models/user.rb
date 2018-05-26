class User < ActiveRecord::Base
  has_many :recipes
  has_many :ingredients
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  validates :email, presence: true
  accepts_nested_attributes_for :recipes
  has_secure_password

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.name = auth.info.name
      user.save!
    end
  end

  def ingred_by_due_date
    ingredients.reverse
  end
end

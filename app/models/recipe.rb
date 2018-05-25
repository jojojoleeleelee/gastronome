class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :user, optional: false
  validates_uniqueness_of :title

  scope :cooked, -> {where(cooked: true)}

  def most_active_user
    # Recipe.all.each do |recipe|
    #   recipe.user.group(:name).order('count_id DESC').limit(1).count(:id)
    # end
  end
end

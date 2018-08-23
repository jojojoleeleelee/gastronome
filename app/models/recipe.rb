class Recipe < ActiveRecord::Base
  belongs_to :recipe_ingredient
  belongs_to :user, optional: false
  has_many :comments
  validates_uniqueness_of :title

  scope :cooked, -> {where(cooked: true)}

  def most_active_user
    # Recipe.all.each do |recipe|
    #   recipe.user.group(:name).order('count_id DESC').limit(1).count(:id)
    # end
  end

  def all_comments
    self.comments.sort.reverse
  end

  def is_not_last
    Recipe.exists?(self.id + 1)
  end

  def is_not_first
    Recipe.exists?(self.id - 1)
  end
end

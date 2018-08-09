class Comment < ApplicationRecord
  validates :content, presence: true
  
  belongs_to :recipe, class_name: "Recipe", foreign_key: "recipe_id"

  def time
    self.created_at.strftime("%m/%d/%y at %I:%M%p %Z")
  end
end

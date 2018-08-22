class RecipeSerializer < ActiveModel::Serializer
  attributes :title, :user_id, :pic_url, :ingred, :description, :cooked

  has_many :comments
end

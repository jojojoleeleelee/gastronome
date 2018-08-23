class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :recipe_id, :created_at
end

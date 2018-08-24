class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :is_not_first, :is_not_last
end

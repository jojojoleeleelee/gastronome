class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :notFirst, :notLast
end

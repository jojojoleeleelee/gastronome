class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :recipe_id
end

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :user, :created_at

  belongs_to :user
end

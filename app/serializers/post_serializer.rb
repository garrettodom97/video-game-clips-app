class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :video, :user_id, :created_at

  belongs_to :user
  has_many :comments
  has_many :likes
end

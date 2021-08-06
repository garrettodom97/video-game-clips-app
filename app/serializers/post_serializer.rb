class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :video, :user_id

  belongs_to :user
  has_many :comments
end

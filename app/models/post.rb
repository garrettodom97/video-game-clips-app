class Post < ApplicationRecord
  validates :title, presence: true
  validates :video, presence: true

  belongs_to :user
  has_many :comments
  has_many :likes

  def created_at
    attributes["created_at"].strftime("%-I:%M %p %m/%d/%Y ")
  end
end

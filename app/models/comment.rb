class Comment < ApplicationRecord
  validates :text, presence: true

  def created_at
    attributes["created_at"].strftime("%-I:%M %p %m/%d/%Y ")
  end

  belongs_to :user
  belongs_to :post
end

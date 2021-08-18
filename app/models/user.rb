class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true

  def created_at
    attributes["created_at"].strftime("%-I:%M %p %m/%d/%Y ")
  end

  has_many :posts
  has_many :comments
end

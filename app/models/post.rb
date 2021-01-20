class Post < ApplicationRecord
  belongs_to :user
  has_many :praises, dependent: :destroy

  validates :title, presence: true, length: {maximum: 30}
  validates :text, presence: true, length: {maximum: 2000}
end

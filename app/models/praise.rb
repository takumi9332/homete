class Praise < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :bests, dependent: :destroy

  validates :text, presence: true, length: { maximum: 1000 }
end

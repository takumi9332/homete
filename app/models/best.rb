class Best < ApplicationRecord
  belongs_to :user
  belongs_to :praise
  belongs_to :post

  validates_uniqueness_of :post_id, scope: :user_id
end

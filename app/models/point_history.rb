class PointHistory < ApplicationRecord
  has_many :point_breakdowns
  has_many :user_points, through: :point_breakdowns

  belongs_to :user
  belongs_to :pointable, polymorphic: true
end

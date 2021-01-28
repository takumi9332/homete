class PointBreakdown < ApplicationRecord
  belongs_to :user_point
  belongs_to :point_history
end

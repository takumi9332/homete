class Charge < ApplicationRecord
  has_one :point_history, as: :pointable, inverse_of: :pointable
end

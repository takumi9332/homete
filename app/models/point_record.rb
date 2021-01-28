# PointRecord.new(Pay.find(1), User.find(current_user.id), 100).use!
# PointRecord.new(Charge.find(1), User.find(current_user.id), 50).use!
class PointRecord
  # このクラスにあるメソッドを使用する時は、トランザクションの処理で囲って下さい
  def initialize(klass, user, amount)
    @klass = klass
    @user = user
    @amount = amount
  end

  # Pointを使用した処理
  def use!
    point_history = @klass.create_point_history!(user_id: @user.id, amount: - @amount)
    temp_amount = @amount
    UserPoint.valid_points(@user.id).each do | user_point |
      if user_point.amount >= temp_amount
        user_point.amount = user_point.amount - temp_amount
        PointBreakdown.create!(user_point_id: user_point.id,
                               point_history_id: point_history.id,
                               amount: - temp_amount)
        user_point.save!
        break
      else
        temp_amount -= user_point.amount
        PointBreakdown.create!(user_point_id: user_point.id,
                               point_history_id: point_history.id,
                               amount: - user_point.amount)
        user_point.amount = 0
        user_point.save!
      end
    end
  end

  # Pointを獲得した処理
  def reward!
    point_history = @klass.create_point_history!(user_id: @user.id, amount: @amount)
    user_point = UserPoint.create!(user_id: @user.id, amount: @amount)
    PointBreakdown.create!(user_point_id: user_point.id,
                           point_history_id: point_history.id,
                           amount: @amount)
  end
end
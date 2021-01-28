class CreatePointBreakdowns < ActiveRecord::Migration[6.1]
  def change
    create_table :point_breakdowns do |t|
      t.integer :amount, null: false
      t.references :user_point, null: false, foreign_key: true
      t.references :point_history, null: false, foreign_key: true
      t.timestamps
    end
  end
end

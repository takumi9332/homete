class CreatePointHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :point_histories do |t|
      t.integer :amount, null: false
      t.integer :pointable_id
      t.string :pointable_type
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_index :point_histories, [:pointable_id, :pointable_type]
  end
end

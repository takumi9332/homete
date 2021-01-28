class CreateUserPoints < ActiveRecord::Migration[6.1]
  def change
    create_table :user_points do |t|
      t.integer :amount, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

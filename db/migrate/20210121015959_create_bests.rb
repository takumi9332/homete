class CreateBests < ActiveRecord::Migration[6.1]
  def change
    create_table :bests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :praise, null: false, foreign_key: true
      t.timestamps
    end
  end
end

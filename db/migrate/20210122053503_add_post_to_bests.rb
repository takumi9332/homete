class AddPostToBests < ActiveRecord::Migration[6.1]
  def change
    add_reference :bests, :post, null: false, foreign_key: true
  end
end

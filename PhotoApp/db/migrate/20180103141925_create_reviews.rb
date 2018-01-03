class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.boolean :like, default: false
      t.text :comment
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end

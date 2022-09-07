class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :description
      t.integer :rating
      t.integer :restaurant_id
      t.timestamps
      t.integer :user_id
    end
  end
end

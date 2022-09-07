class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :cuisine
      t.string :price_range
      t.string :location
      t.string :image
      t.string :website
      t.timestamps
    end
  end
end

class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :avg_rating
      t.string :review_count
      t.string :link
      t.integer :location_id
      t.timestamps
    end
  end
end

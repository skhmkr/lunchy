class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :title
      t.string :address
      t.string :link
      t.integer :user_id

      t.timestamps
    end
  end
end

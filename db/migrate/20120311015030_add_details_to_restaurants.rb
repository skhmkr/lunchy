class AddDetailsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :lat, :decimal

    add_column :restaurants, :lon, :decimal

  end
end

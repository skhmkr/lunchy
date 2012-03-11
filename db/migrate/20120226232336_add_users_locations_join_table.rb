class AddUsersLocationsJoinTable < ActiveRecord::Migration
  def up
    create_table :locations_users, :id => false do |t|
      t.references :location
      t.references :user
    end
    add_index :locations_users, [:location_id, :user_id]
    add_index :locations_users, [:user_id, :location_id]
  end
  def down
    drop_table :locations_users
  end
end

class AddDestructAtToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :destruct_at, :timestamp, null: false, default: Time.at(0)
    add_column :posts, :lifespan, :integer , null: false, default: 0
  end
end

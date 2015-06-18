class AddPostCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :post_count, :integer
  end
end

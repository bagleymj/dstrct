class RemoveDefaultLifespanFromPosts < ActiveRecord::Migration
  def change
    change_column_null(:posts, :lifespan, true)
    change_column_default(:posts, :lifespan, nil)
  end
end

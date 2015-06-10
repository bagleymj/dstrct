class AddFieldsToPost < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.string  :title
      t.string  :content
    end
  end
end

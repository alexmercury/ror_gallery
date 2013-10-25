class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :picture_id
      t.integer :user_id
      t.datetime :created_at
    end

    add_column :users, :likes_count, :integer, default: 0
    add_column :pictures, :likes_count, :integer, default: 0
  end
end
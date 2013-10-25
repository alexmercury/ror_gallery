class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.integer :user_id
      t.integer :picture_id

      t.timestamps
    end

    add_column :pictures, :comments_count, :integer, default: 0
    add_column :users, :comments_count, :integer, default: 0

  end
end
class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :kind
      t.integer :kind_id
      t.datetime :created_at
    end
  end
end

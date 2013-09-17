class CreateNavigationEvents < ActiveRecord::Migration
  def change
    create_table :navigation_events do |t|
      t.integer :user_id
      t.string :url
      t.datetime :created_at
    end
  end
end

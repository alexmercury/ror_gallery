class AddCounterAndUserName < ActiveRecord::Migration
  def change

    add_column :users, :name, :string, default: 'user'
    add_column :categories, :pictures_count, :integer, default: 0

  end
end
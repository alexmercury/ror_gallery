class SlugForCategory < ActiveRecord::Migration

  def change
    rename_column :categories, :title, :slug
    add_index :categories, :slug, unique: true
  end

end

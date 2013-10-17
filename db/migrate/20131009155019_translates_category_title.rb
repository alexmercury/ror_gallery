class TranslatesCategoryTitle < ActiveRecord::Migration
  def up
    Category.create_translation_table!({title_locale: :string})
  end

  def down
    Category.drop_translation_table!
  end
end

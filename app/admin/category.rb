ActiveAdmin.register Category do

  filter :title, as: :string

  index do
    selectable_column
    column :title
    column :pictures_count
    column :created_at
    column :updated_at
    default_actions
  end

end
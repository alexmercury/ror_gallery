ActiveAdmin.register Category do

  filter :title, as: :string

  index do
    selectable_column
    column :title
    column 'Locale title ru' do |category|
      category.title_locale(:ru)
    end
    column 'Locale title en' do |category|
      category.title_locale(:en)
    end
    column :pictures_count
    column :created_at
    column :updated_at
    default_actions
  end

  form html: { :multipart => true } do |f|
    f.inputs 'Category Details' do
      f.input :title, as: :string
      f.input :title_locale, as: :string, hint: f.template.hidden_field_tag(:locale, params[:locale])
    end
    f.actions
  end

  controller do
    before_filter :set_locale

    def set_locale
      I18n.locale = params[:locale]
    end

  end

end
ActiveAdmin.register Picture do

  filter :title, as: :string

  index do
    selectable_column
    column 'image' do |picture|
       image_tag picture.image.url(:mini), height: 40, title: picture.image_file_name
    end
    column :title
    column :created_at
    column :updated_at
    default_actions
  end

  filter :email

  form html: { :multipart => true } do |f|
    f.inputs 'Admin Details' do
      f.input :title, as: :string
      f.input :image, as: :file, hint: f.object.image.nil? ? f.template.content_tag(:span, 'no map yet') : f.template.image_tag(f.object.image.url)
    end
    f.actions
  end

end
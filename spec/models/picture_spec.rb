require 'spec_helper'

describe Picture  do

  context 'Picture db column' do
    it {should have_db_column(:title).of_type(:string)}
    it {should have_db_column(:created_at).of_type(:datetime)}
    it {should have_db_column(:updated_at).of_type(:datetime)}
    it {should have_db_column(:image_file_name).of_type(:string)}
    it {should have_db_column(:image_content_type).of_type(:string)}
    it {should have_db_column(:image_updated_at).of_type(:datetime)}
    it {should have_db_column(:image_file_size).of_type(:integer)}
    it {should have_db_column(:category_id).of_type(:integer)}
    it {should have_db_column(:likes_count).of_type(:integer)}
    it {should have_db_column(:comments_count).of_type(:integer)}
  end

  context 'Picture attr_accessible attributes' do
    it {should allow_mass_assignment_of(:title)}
    it {should allow_mass_assignment_of(:image)}
    it {should allow_mass_assignment_of(:category_id)}
  end

  context 'Picture model relationship' do
    it {should belong_to(:category)}
    it {should have_many(:likes).dependent(:destroy)}
    it {should have_many(:users).through(:likes)}
    it {should have_many(:comments).dependent(:destroy)}
  end

  context 'Picture validations attributes' do
    it {should validate_presence_of(:title)}
    it {should ensure_length_of(:title).is_at_least(5).is_at_most(255)}
    it {should validate_presence_of(:category_id)}
    it {should validate_numericality_of(:category_id).only_integer}
  end

  context 'to param' do

    it 'To param' do
      category = FactoryGirl.create(:category)
      category.pictures.create(title: 'image_new', image: File.open(Rails.root.join('spec/factories/image/img.gif')))
      picture = Picture.includes(:category).last
      picture.to_param.should.equal? category.slug
      Picture.destroy_all
    end

  end

end
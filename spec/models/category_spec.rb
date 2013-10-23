require 'spec_helper'

describe Category  do

  context 'Category db column' do
    it {should have_db_column(:slug).of_type(:string)}
    it {should have_db_column(:created_at).of_type(:datetime)}
    it {should have_db_column(:updated_at).of_type(:datetime)}
    it {should have_db_column(:pictures_count).of_type(:integer).with_options(default: 0)}
  end

  context 'Category attr_accessible attributes' do
    it {should allow_mass_assignment_of(:slug)}
    it {should allow_mass_assignment_of(:title_locale)}
    it {should allow_mass_assignment_of(:translations)}
  end

  context 'Category model relationship' do
    it {should have_many(:pictures).dependent(:destroy)}
    it {should have_many(:category_subscriptions).dependent(:destroy)}
    it {should have_many(:users).through(:category_subscriptions)}
    it {should have_many(:included_pictures)}
  end

  context 'Category validations attributes' do
    it {should validate_presence_of(:slug)}
    it {should validate_uniqueness_of(:slug)}
    it {should ensure_length_of(:slug).is_at_least(1).is_at_most(255)}
  end

end
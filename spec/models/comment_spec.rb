require 'spec_helper'

describe Comment  do

  context 'Comment db column' do
    it {should have_db_column(:description).of_type(:text)}
    it {should have_db_column(:user_id).of_type(:integer)}
    it {should have_db_column(:picture_id).of_type(:integer)}
    it {should have_db_column(:created_at).of_type(:datetime)}
    it {should have_db_column(:updated_at).of_type(:datetime)}
  end

  context 'Comment attr_accessible attributes' do
    it {should allow_mass_assignment_of(:description)}
    it {should allow_mass_assignment_of(:user_id)}
    it {should allow_mass_assignment_of(:picture_id)}
  end

  context 'Comment model relationship' do
    it {should belong_to(:user)}
    it {should belong_to(:picture)}
  end

  context 'Comment validations attributes' do
    it {should validate_presence_of(:description)}
    it {should ensure_length_of(:description).is_at_least(2).is_at_most(1000)}
    it {should validate_presence_of(:picture_id)}
    it {should validate_numericality_of(:picture_id).only_integer}
    it {should validate_presence_of(:user_id)}
    it {should validate_numericality_of(:user_id).only_integer}
  end

end
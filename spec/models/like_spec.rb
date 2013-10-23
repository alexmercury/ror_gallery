require 'spec_helper'

describe Like  do

  context 'Like db column' do
    it {should have_db_column(:picture_id).of_type(:integer)}
    it {should have_db_column(:user_id).of_type(:integer)}
    it {should have_db_column(:created_at).of_type(:datetime)}
  end

  context 'Like attr_accessible attributes' do
    it {should allow_mass_assignment_of(:user_id)}
    it {should allow_mass_assignment_of(:picture_id)}
  end

  context 'Like model relationship' do
    it {should belong_to(:user)}
    it {should belong_to(:picture)}
  end

  context 'Like validations attributes' do
    it {should validate_presence_of(:picture_id)}
    it {should validate_numericality_of(:picture_id).only_integer}
    it {should validate_presence_of(:user_id)}
    it {should validate_numericality_of(:user_id).only_integer}
  end

end
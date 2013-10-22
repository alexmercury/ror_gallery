require 'spec_helper'

describe CategorySubscription  do

  context 'CategorySubscription db column' do
    it {should have_db_column(:user_id).of_type(:integer)}
    it {should have_db_column(:category_id).of_type(:integer)}
    it {should have_db_column(:created_at).of_type(:datetime)}
  end

  context 'CategorySubscription attr_accessible attributes' do
    it {should allow_mass_assignment_of(:category_id)}
    it {should allow_mass_assignment_of(:user_id)}
  end

  context 'CategorySubscription model relationship' do
    it {should belong_to(:user)}
    it {should belong_to(:category)}
  end

  context 'CategorySubscription validations attributes' do
    it {should validate_presence_of(:category_id)}
    it {should validate_numericality_of(:category_id).only_integer}
    it {should validate_presence_of(:user_id)}
    it {should validate_numericality_of(:user_id).only_integer}
  end

end
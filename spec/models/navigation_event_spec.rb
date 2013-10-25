require 'spec_helper'

describe NavigationEvent  do

  context 'NavigationEvent db column' do
    it {should have_db_column(:user_id).of_type(:integer)}
    it {should have_db_column(:url).of_type(:string)}
    it {should have_db_column(:created_at).of_type(:datetime)}
  end

  context 'NavigationEvent attr_accessible attributes' do
    it {should allow_mass_assignment_of(:url)}
    it {should allow_mass_assignment_of(:created_at)}
    it {should allow_mass_assignment_of(:user_id)}
  end

  context 'NavigationEvent model relationship' do
    it {should belong_to(:user)}
  end

end
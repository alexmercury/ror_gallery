require 'spec_helper'

describe Event  do

  context 'Event db column' do
    it {should have_db_column(:user_id).of_type(:integer)}
    it {should have_db_column(:kind).of_type(:string)}
    it {should have_db_column(:kind_id).of_type(:integer)}
    it {should have_db_column(:created_at).of_type(:datetime)}
  end

  context 'Event attr_accessible attributes' do
    it {should allow_mass_assignment_of(:kind)}
    it {should allow_mass_assignment_of(:kind_id)}
    it {should allow_mass_assignment_of(:user_id)}
  end

  context 'Event model relationship' do
    it {should belong_to(:user)}
  end

end
require 'spec_helper'

describe AdminUser  do

  context 'AdminUser db column' do
    it {should have_db_column(:email).of_type(:string)}
    it {should have_db_column(:encrypted_password).of_type(:string)}
    it {should have_db_column(:reset_password_token).of_type(:string)}
    it {should have_db_column(:reset_password_sent_at).of_type(:datetime)}
    it {should have_db_column(:remember_created_at).of_type(:datetime)}
    it {should have_db_column(:sign_in_count).of_type(:integer)}
    it {should have_db_column(:current_sign_in_at).of_type(:datetime)}
    it {should have_db_column(:last_sign_in_at).of_type(:datetime)}
    it {should have_db_column(:current_sign_in_ip).of_type(:string)}
    it {should have_db_column(:last_sign_in_ip).of_type(:string)}
    it {should have_db_column(:created_at).of_type(:datetime)}
    it {should have_db_column(:updated_at).of_type(:datetime)}
  end

  context 'AdminUser attr_accessible attributes' do
    it {should allow_mass_assignment_of(:email)}
    it {should allow_mass_assignment_of(:password)}
    it {should allow_mass_assignment_of(:password_confirmation)}
    it {should allow_mass_assignment_of(:remember_me)}
  end

end
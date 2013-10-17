require 'spec_helper'

describe User  do

  context 'User db column' do
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
    it {should have_db_column(:likes_count).of_type(:integer)}
    it {should have_db_column(:name).of_type(:string)}
    it {should have_db_column(:comments_count).of_type(:integer)}
    it {should have_db_column(:provider).of_type(:string)}
    it {should have_db_column(:uid).of_type(:string)}
    it {should have_db_column(:oauth_token).of_type(:string)}
    it {should have_db_column(:oauth_expires_at).of_type(:datetime)}
  end

  context 'User attr_accessible attributes' do
    it {should allow_mass_assignment_of(:email)}
    it {should allow_mass_assignment_of(:password)}
    it {should allow_mass_assignment_of(:password_confirmation)}
    it {should allow_mass_assignment_of(:remember_me)}
    it {should allow_mass_assignment_of(:provider)}
    it {should allow_mass_assignment_of(:uid)}
    it {should allow_mass_assignment_of(:name)}
    it {should allow_mass_assignment_of(:captcha)}
    it {should allow_mass_assignment_of(:captcha_key)}
  end

  context 'User model relationship' do
    it {should have_many(:likes).dependent(:destroy)}
    it {should have_many(:comments).dependent(:destroy)}
    it {should have_many(:category_subscriptions).dependent(:destroy)}
    it {should have_many(:events).dependent(:destroy)}
    it {should have_many(:navigation_events).dependent(:destroy)}
    it {should have_many(:categories).through(:category_subscriptions)}
  end

  context 'User validations attributes' do
    it {should validate_presence_of(:name)}
    it {should ensure_length_of(:name).is_at_least(3).is_at_most(100)}
  end

end
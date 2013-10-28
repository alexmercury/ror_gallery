require 'simplecov'
SimpleCov.start 'rails'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'shoulda-matchers'
require 'capybara/rspec'
require 'factory_girl'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|

  config.use_transactional_fixtures = false

  config.infer_base_class_for_anonymous_controllers = false

  config.include Devise::TestHelpers, type: :controller

  config.order = 'random'

  config.before :each do
    DatabaseCleaner.start
  end
  config.after :each do
    DatabaseCleaner.clean
  end

end
# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {js_errors: false})
end


Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  AWS.stub!
  
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.include Warden::Test::Helpers
  Warden.test_mode!

  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.before(:all) do 
  Geocoder.configure(:lookup => :test)

  Geocoder::Lookup::Test.add_stub(
  "25 city road,London,EC1Y 1AA", [
    {
      'latitude'     => 51.5229965,
      'longitude'    => -0.0871299,
      'address'      => '25 City Road, London EC1Y 1AA, UK',
      'country'      => 'United Kingdom',
      'country_code' => 'UK'
    }
   ]
  )

  Geocoder::Lookup::Test.add_stub(
  "Victoria St,London,SW1E 5ND", [
    {
      'latitude'     => 51.4935138,
      'longitude'    => -0.1421816,
      'address'      => 'Victoria, London SW1E 5ND, UK',
      'country'      => 'United Kingdom',
      'country_code' => 'UK'
    }
   ]
  )
  end

end

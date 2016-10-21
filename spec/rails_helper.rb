# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../dummy/config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'devise'
require 'factory_girl_rails'
require 'rails-controller-testing'
require 'shoulda-matchers'
require 'database_cleaner'
require 'byebug'
require 'support/database_cleaner'
require 'support/test_helper'
require 'support/capybara'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/webkit/matchers'
require 'capybara-webkit'

Capybara.javascript_driver = :webkit
Capybara.default_driver = :webkit
Capybara.run_server = true
Capybara.server_port = 7000
Capybara.app_host = "http://localhost:#{Capybara.server_port}"

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  # FactoryGirl Methods
  config.include FactoryGirl::Syntax::Methods

  # Devise helpers
  config.include Devise::Test::ControllerHelpers, type: :controller

  [:controller, :view, :request].each do |type|
    config.include ::Rails::Controller::Testing::TestProcess, :type => type
    config.include ::Rails::Controller::Testing::TemplateAssertions, :type => type
    config.include ::Rails::Controller::Testing::Integration, :type => type
  end

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!

  config.include(Capybara::Webkit::RspecMatchers, type: :feature)
  config.include RSpec::Rails::RequestExampleGroup, type: :feature
  config.include Capybara::DSL, :type => :controller
  config.include(TestHelper)

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

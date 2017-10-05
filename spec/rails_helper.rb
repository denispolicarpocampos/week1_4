require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'capybara/poltergeist'

ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join("spec/support/*.rb")].each { |file| require file }

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/factories"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

Capybara.javascript_driver = :poltergeist

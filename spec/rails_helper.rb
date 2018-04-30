ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

# ActiveRecord::Migration.maintain_test_schema!
# ActiveJob::Base.queue_adapter = :test
RSpec.configure do |config|
  # config.extend ControllerMacros, type: :controller
  config.extend AuthHelper, type: :controller
  %i[controller view request].each do |type|
    config.include ::Rails::Controller::Testing::TestProcess, type: type
    config.include ::Rails::Controller::Testing::TemplateAssertions, type: type
    config.include ::Rails::Controller::Testing::Integration, type: type
  end
  config.include ActiveJob::TestHelper, type: :job
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.infer_spec_type_from_file_location!
  config.example_status_persistence_file_path = "#{::Rails.root}/temp/rspec-failures.txt"
end

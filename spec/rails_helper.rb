# frozen_string_literal: true

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require('database_cleaner/active_record')
require 'timecop'
require 'pundit/rspec'
require('capybara/rspec')
require('capybara-screenshot/rspec')
require 'simplecov' if ENV['COVERAGE'] == 'true'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit(1)
end

ActiveJob::Base.queue_adapter = :test

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include(Rails.application.routes.url_helpers)
  config.include(FactoryBot::Syntax::Methods)
  config.include(Capybara::DSL, type: :request)
  config.include(Warden::Test::Helpers)

  config.use_transactional_fixtures = true
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
  config.after do
    Timecop.return
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework(:rspec)
    with.library(:rails)
  end
end

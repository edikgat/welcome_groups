# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'mysql2', '>= 0.4.4'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.6'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise', '~> 4.8'
gem 'multi_json', '~> 1.15.0'
gem 'pundit', '~> 2.1.1'
gem 'react-rails', '~> 2.6.1'
gem 'roar', '~> 1.1.0'

group :development, :test do
  gem 'factory_bot_rails', '~> 6.1.0'
  gem 'faker', '~> 2.19.0'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rubocop', '~> 1.20.0', require: false
  gem 'rubocop-rails', '~> 2.11.3', require: false
  gem 'rubocop-rspec', '~> 2.4.0', require: false
end

group :development do
  gem 'brakeman', '~> 5.1.1', require: false
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'action-cable-testing', '~> 0.6.1'
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner-active_record', '~> 2.0.0'
  gem 'selenium-webdriver', '~> 3.142.7'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', '~> 0.21.2', require: false
  gem 'webdrivers', '~> 4.6.1'
end

gem 'tzinfo-data', '~> 1.2.9', platforms: %i[mingw mswin x64_mingw jruby]

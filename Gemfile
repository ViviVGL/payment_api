# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.0'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.7'
  gem 'rubocop', '~> 0.57.2', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data'

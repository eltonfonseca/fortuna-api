# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'devise-jwt'
gem 'fast_jsonapi'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rack-cors'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development do
  gem 'listen', '~> 3.2'
  gem 'mailcatcher'
  gem 'rubocop', '~> 0.88.0', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'pry', '~> 0.12.2'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 4.0.1'
end

group :test do
  gem 'codecov', require: false
  gem 'shoulda-matchers', '~> 4.0'
  gem 'simplecov', require: false
end

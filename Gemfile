# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
gem 'carrierwave', '>= 2.0.0.rc', '< 3.0'
gem 'devise'
gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
gem 'friendly_id', '~> 5.2.4'
gem 'haml-rails', '~> 2.0'
gem 'kaminari'
gem 'omniauth-facebook'
group :development, :test do
  gem 'dotenv-rails'
end
gem 'activeadmin'
gem 'aws-sdk', '~> 3'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'bootstrap_form', '~> 2.3'
gem 'devise-i18n'
gem 'file_validators'
gem 'fog-aws'
gem 'httparty'
gem 'jquery-rails'
gem 'nokogiri', '~> 1.10'
gem 'popper_js', '~> 1.14', '>= 1.14.5'
gem 'rails-i18n', '~> 5.1'
gem 'recaptcha'
gem 'redis-rails'
gem 'resque', '~> 2.0'
gem 'resque-scheduler'
gem 'sassc-rails', '>= 2.1.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster.
#                     Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a
  #                                                           debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling
  #                                             'console' anywhere in the code.
  # gem 'web-console', '>= 3.3.0'
  # gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running
  #               in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development do
  gem 'capistrano', '~> 3.10', require: false
  gem 'capistrano-bundler', '~> 1.1', '>= 1.1.4'
  gem 'capistrano-passenger', '~> 0.2.0'
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-rvm'
  gem 'sshkit', '~> 1.20'
  # gem 'rvm1-capistrano3', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end
group :development do
  gem 'capistrano-figaro-yml', '~> 1.0.2'
end
# gem 'capistrano-dotenv', require: false

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 3.29'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Run against the latest stable release
group :development, :test do
  gem 'factory_bot_rails'
  gem 'fuubar', '~> 2.4', '>= 2.4.1'
  gem 'rspec-rails', '~> 3.8'
  gem 'rspec-activemodel-mocks'
end
group :test do
  gem 'database_cleaner', '~> 1.7'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
end
gem 'simplecov', require: false, group: :test
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

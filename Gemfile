source 'https://rubygems.org'


gem 'actionpack'
gem 'actionview'
gem 'activemodel'
gem 'activerecord'
gem 'activesupport'
# Use SCSS for stylesheets
gem 'sass-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
gem 'csv'
gem 'faraday'

gem 'health-monitor-rails', '12.9.0'
gem 'omniauth'
gem "omniauth-cas"
gem "pg"
gem 'simple_form'
gem 'susy'
gem 'breakpoint'
gem 'bourbon'
gem 'jquery-tablesorter'
gem "nokogiri"

group :development, :test do
  gem 'brakeman'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'puma'
  gem 'rspec-rails'
  gem 'rails-controller-testing'
end

group :test do
  gem "webmock", require: false
  gem 'factory_bot_rails', require: false
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'axe-core-rspec'
  gem 'simplecov', require: false
end

group :development do
  gem 'bcrypt_pbkdf'
  gem "capistrano"
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
  gem 'ed25519'
end

gem 'json', '< 4.0'

group :staging, :production do
  gem 'honeybadger'
end

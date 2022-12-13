source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', group: :doc

gem 'cancancan', '~> 3.3'
gem 'faraday'
gem 'faraday_middleware'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'devise'
gem 'omniauth'
gem "omniauth-cas"
gem "pg"
gem 'simple_form'
gem 'normalize-rails'
gem 'susy'
gem 'breakpoint'
gem 'bourbon'
gem 'pul-assets', github: 'pulibrary/pul_assets', branch: :main
gem 'jquery-tablesorter'
gem 'modernizr-rails'
gem "nokogiri"

group :development, :test do
  gem 'brakeman'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'listen'
  gem 'webrick', '~> 1.7'
end

group :test do
  gem "webmock", require: false
  gem 'poltergeist'
  gem 'factory_bot_rails', require: false
  gem 'capybara'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
  gem "capistrano", "~> 3.4"
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end


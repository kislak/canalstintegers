source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.8'

gem 'sqlite3', :group => [:development, :test]
gem 'pg', :group => :production

gem "randumb", "~> 0.3.0"
gem "twitter", "~> 3.6.0"
gem "acts_as_api"

group :development do
  gem 'quiet_assets'
  gem 'heroku'
  gem 'taps'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'capybara'
end

group :production do
  gem 'newrelic_rpm'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'
gem 'thin'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

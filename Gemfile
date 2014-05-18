source 'http://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.18'

# Mongo stuff.
gem 'mongoid', '~> 2.4'
gem 'bson_ext', '~> 1.6'

# Redis
gem 'hiredis', '~> 0.4.5'
gem 'redis', '~> 2.2.0', :require => ['redis/connection/hiredis', 'redis']

# Making HTTP requests easier.
gem 'httparty'

gem 'geocoder'
gem 'haml'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier',     '>= 1.2.3'
  gem 'compass',      '~> 0.12.alpha'
end
gem 'jbuilder'
gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development, :test do
  gem 'rspec-rails'
  gem 'guard'
  gem 'guard-rspec'
  #gem 'watchr'
  gem 'pry-rails'
  gem 'awesome_print'
end

group :test do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
  gem 'database_cleaner'

  gem 'vcr'
  gem 'fakeweb'
end

group :production do
  gem 'thin'
  gem 'newrelic_rpm'
end



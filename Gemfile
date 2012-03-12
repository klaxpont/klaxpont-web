source 'http://rubygems.org'

gem 'rails', '3.2.2'

# Mongo stuff.
gem 'mongoid', '~> 2.4'
gem 'bson_ext', '~> 1.6'



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier',     '>= 1.2.3'
  gem 'compass',      '~> 0.12.alpha'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
end

group :production do
  gem 'thin'
end

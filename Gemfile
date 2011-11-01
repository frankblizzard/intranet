source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# gem 'sqlite3'

gem 'mysql2'

gem 'haml'
gem 'haml-rails', :group => :development
gem 'simple_form'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'


# authentication

gem 'devise', '1.4.9'
gem 'cancan'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'


group :development, :test do
  gem 'database_cleaner'
  gem 'rails3-generators' #mainly for factory_girl & simple_form at this point
  gem 'factory_girl_rails'
  gem 'cucumber-rails'
  gem 'rspec-rails'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'growl'
  gem 'capybara'
  gem 'guard-rspec'
end

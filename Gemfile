source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem 'dynamic_form', '1.1.4'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'devise'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation', '~>4.0.0'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
group :test, :development do
  gem 'pry'
  gem 'pry-debugger'
	gem 'rspec-rails', '~> 2.11'
	gem 'factory_girl', '2.6.2'
  gem 'letter_opener'
end

group :test do
	gem 'capybara', '1.1.2'
	gem 'email_spec'
  gem 'simplecov', :require => false
end

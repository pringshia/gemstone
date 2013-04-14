source 'https://rubygems.org'

gem 'rails', '3.2.6'

# koala is a good gem for accessing the Facebook graph (https://github.com/arsduo/koala)
gem 'koala'
gem 'omniauth-facebook'

group :development, :test do
    gem 'sqlite3'
    gem 'factory_girl_rails', '~> 4.2.1'
    gem 'faker'
    gem 'rspec-rails', '~> 2.12.2'
    gem 'capybara'
end

group :production do
    gem 'pg'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
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

source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use Postgresql as the database for Active Record
gem 'sqlite3'
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'haml'
gem 'haml-rails'
gem 'devise'

#for uploading images
gem 'carrierwave'
gem 'rmagick'

gem 'responders'

#Redis
gem 'redis'
gem 'redis-objects'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Forms
gem 'simple_form'
gem 'country_select', github: 'stefanpenner/country_select'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'fog'

# Use Unicorn as the app server
gem 'unicorn'

# Using MINA for deployment
gem 'mina'
gem 'mina-unicorn', require: false
gem 'mina-slack', require: false

#Bootstrap gem
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers', require: false
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug'
  gem 'pry'

  # Access an IRB console on exception pages or by using <%= console %> in views
  # gem 'web-console', '~> 2.0'

  #database cleaner
  gem 'database_cleaner'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'erb2haml'
end

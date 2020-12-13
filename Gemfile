source 'https://rubygems.org'
ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2'
# Use sqlite3 as the database for Active Record
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'securerandom'

gem 'actioncable'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc


# OAuth2 authentication gems
# gem 'omniauth-twitter'
# gem 'omniauth-google-oauth2'
# gem 'devise'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Gems for react portion of application
gem 'webpacker'
gem 'react_on_rails'
gem 'mini_racer'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'action-cable-testing'
  gem 'byebug'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'factory_bot_rails'
  gem 'launchy'
  gem 'jasmine'
  gem 'jasmine-core'
  gem 'jasmine-rails'
  gem 'jasmine-jquery-rails'
  gem 'rspec', '~>3.5'
  gem 'rspec-rails'

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.3.6'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'simplecov'
  gem 'standard'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
group :test do
  gem 'cucumber', '<4.0.0'
  gem 'cucumber-rails', :require=>false
  gem 'database_cleaner'
  gem 'rspec-expectations'
  gem 'rails-controller-testing'

end

group :development, :production do
  gem 'puma'

end

group :production do
  gem 'pg', '~> 0.21' # for Heroku deployment
  gem 'rails_12factor'
  gem 'redis', '~> 3.0'
end

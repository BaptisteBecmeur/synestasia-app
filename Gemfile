source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma'
# Environnement variables
gem 'figaro'
# Internalization
gem 'rails-i18n', '~> 4.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Bootstrap
gem 'bootstrap-sass'
# Fontawesome
gem 'font-awesome-sass', '~> 4.5.0'

# Bower : for using CSS / JS externals libraries (Bootstrap, DataTables, etc ...).
# Use to replace gem of assets (bootstrap-sass, fontawesome, etc ...)
# https://github.com/rharriso/bower-rails
# gem "bower-rails", "~> 0.10.0"

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Authentification
gem 'devise'
# Rolification and Authorizers
gem 'authority'
gem 'rolify'
# Multiple table inheritance
gem 'active_record-acts_as'
# Sortable active record
gem 'acts_as_list'
# Forms
gem 'simple_form'
# Prefixs CSS
gem 'autoprefixer-rails'
# OAuth
gem 'omniauth'
# Facebook Oauth
gem 'omniauth-facebook'
# Google Auth
gem 'omniauth-google-oauth2'
# Images
gem 'carrierwave'
# Storage
gem 'cloudinary'
# Ruby library for Markdown processing
gem 'redcarpet'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'private_pub'
gem 'thin'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Rails debug
  gem 'pry-rails'
  # Tests
  gem 'rspec-rails', '~> 3.0'
  gem 'spring-commands-rspec'

  # Use the 'dotenv-rails' gem to replace the 'figaro' gem
  # https://github.com/bkeepers/dotenv
  # gem 'dotenv-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  #gem 'web-console', '~> 3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Styling errors
  gem "better_errors"
  gem "binding_of_caller"
  # Quiet assets
  gem 'quiet_assets'
end

group :production do
  # Heroku
  gem 'rails_12factor'
end

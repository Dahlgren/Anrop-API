source 'https://rubygems.org'
ruby '2.6.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.4.3'
# Use mysql2 as the database for Active Record
gem 'mysql2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'
# Use Puma as the app server
gem 'puma'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # rspec for testing
  gem 'rspec-rails', '3.8.2'

  # factory bot for generating models during testing
  gem 'factory_bot_rails', '5.0.2'
end

group :development do
  # The Listen gem listens to file modifications and notifies you about the changes. Used by Rails for auto reload in development.
  gem 'listen'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  # New Relic logging
  gem 'newrelic_rpm'
end

# ActiveModel serialization
gem 'active_model_serializers', '0.10.9'

# CanCanCan for Authorization
gem 'cancancan', '2.3.0'

# Clone ActiveModel objects with relations
gem 'deep_cloneable', '3.0.0'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

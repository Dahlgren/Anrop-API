source 'https://rubygems.org'
ruby '2.3.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.1'
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

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # rspec for testing
  gem 'rspec-rails', '3.6.0'

  # factory girl for generating models during testing
  gem 'factory_girl_rails', '4.8.0'
end

group :development do
  # The Listen gem listens to file modifications and notifies you about the changes. Used by Rails for auto reload in development.
  gem 'listen'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # A Ruby static code analyzer, based on the community Ruby style guide
  gem 'rubocop', '0.49.0'
  gem 'rubocop-rails', '0.4.0'
  gem 'rubocop-rspec', '1.15.1'
end

group :production do
  # New Relic logging
  gem 'newrelic_rpm'
end

# ActiveModel serialization
gem 'active_model_serializers', '0.10.6'

# CanCanCan for Authorization
gem 'cancancan', '1.16.0'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

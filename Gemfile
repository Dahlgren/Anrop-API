source 'https://rubygems.org'
ruby '2.3.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.4'
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
  gem 'rspec-rails', '3.7.2'

  # factory girl for generating models during testing
  gem 'factory_girl_rails', '4.9.0'
end

group :development do
  # The Listen gem listens to file modifications and notifies you about the changes. Used by Rails for auto reload in development.
  gem 'listen'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rails_best_practices'
end

group :production do
  # New Relic logging
  gem 'newrelic_rpm'
end

# ActiveModel serialization
gem 'active_model_serializers', '0.10.7'

# CanCanCan for Authorization
gem 'cancancan', '2.1.2'

# Clone ActiveModel objects with relations
gem 'deep_cloneable', '2.3.1'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

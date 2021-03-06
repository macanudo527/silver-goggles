source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3', '~> 1.4'
gem 'mysql2'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
gem 'feedjira'
gem 'httparty'
gem 'devise'
gem 'kuromoji-ruby'

# used to manipulate the xml rss
gem 'loofah'
gem 'activerecord-import'

# java support needed for kuromoji
gem 'rjb', '~> 1.6', '>= 1.6.1'
gem 'validate_url'
gem 'rails_admin', '~> 2.0'

# enables editor and other roles
gem 'cancancan'
gem "activesupport", ">= 6.0.3.1"
gem "actionpack", ">= 6.0.3.2"
gem "actionview", ">= 6.0.3.3"
gem "activestorage", ">= 6.0.3.1"
gem "inline_svg"

# enables gravatar support
gem "gravtastic"

gem "active_link_to"

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

gem 'pagy', '~> 3.5'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 4.0.0.beta3'
  gem 'guard-rspec', require: false
  gem 'factory_bot_rails', '~> 4.0' 
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'capybara', '~> 3.31'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'pry', git: 'https://github.com/pry/pry.git', ref: '272b3290b5250d28ee82a5ff65aa3b29b825e37b'
  gem 'launchy'
  gem 'webmock', '~> 3.8', '>= 3.8.2'
  gem 'shoulda-matchers'
  gem 'letter_opener'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

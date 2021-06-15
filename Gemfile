source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'bootstrap-sass'
gem 'bootstrap-will_paginate'
gem 'faker'
gem 'jquery-rails'
gem "jquery-ui-rails"
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.1.3.1'
gem 'sqlite3'
gem 'rails-i18n'
gem 'sass-rails', '>= 6'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker', '~> 4.0'
gem 'will_paginate'
# gem 'turbolinks', '~> 5'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'jbuilder', '~> 2.7'
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'mini_magick'
gem 'simple_calendar', '~> 2.0'
gem 'geocoder'
gem 'font-awesome-sass'
gem 'image_processing', '~> 1.2'
gem 'dotenv-rails'
gem 'active_decorator'
gem 'ransack'
gem 'line-bot-api'
gem "aws-sdk-s3", require: false
gem "mimemagic", "~> 0.3.10"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'bullet'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'rubocop', '~> 1.16', require: false
  gem 'rubocop-rails'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem "factory_bot_rails", "~> 4.10.0"
  gem 'launchy', '~> 2.4.3'
  gem 'poltergeist'
  gem 'rspec-rails', '~> 3.8.0'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'pg', '0.20.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

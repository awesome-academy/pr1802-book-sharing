source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.5.1"

gem "bcrypt", "3.1.12"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap", "~> 4.1.3"
gem "bootstrap-will_paginate"
gem "carrierwave", "1.2.2"
gem "carrierwave-i18n"
gem "ckeditor"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "faker", "1.7.3"
gem "font-awesome-rails"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "mini_magick", "4.7.0"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.0"
gem "sass-rails", "~> 5.0"
gem "sqlite3"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "will_paginate", "~> 3.1.0"

group :development, :test do
  gem "autoprefixer-rails"
  gem "better_errors"
  gem "binding_of_caller"
  gem "brakeman", require: false
  gem "bundler-audit"
  gem "byebug", platforms: %i(mri mingw x64_mingw)
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "guard-rspec", require: false
  gem "railroady"
  gem "rails_best_practices"
  gem "reek"
  gem "rspec"
  gem "rspec-collection_matchers"
  gem "rspec-rails", "~> 3.8"
  gem "rubocop", "~> 0.59.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "scss_lint_reporter_checkstyle", require: false
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15", "< 4.0"
  gem "chromedriver-helper"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "simplecov-json"
  gem "simplecov-rcov", require: false
end

group :production do
  gem "fog", "1.42"
end

gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)

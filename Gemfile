# frozen_string_literal: true

source "https://rubygems.org"

gem "bootsnap", require: false
gem "good_migrations"
gem "mysql2", "~> 0.5"
gem "puma", ">= 5.0"
gem "rails", "~> 7.2.1"
gem "tzinfo-data", platforms: %i[windows jruby]

gem "sidekiq", "~> 7.0"
gem "sidekiq-scheduler", "~> 5.0", ">= 5.0.6"

group :development, :test do
  gem "brakeman", require: false
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "dotenv", ">= 3.0"
  gem "factory_bot_rails"
  gem "rspec-rails"
end

group :development do
  gem "annotate"
  gem "bullet"
  gem "bundler-audit", require: false
  gem "letter_opener"
  gem "rubocop", require: false
  gem "rubocop-factory_bot", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", ">= 2.22.0", require: false
end

group :test do
  gem "shoulda-matchers"
end

# Docs API
gem "rswag"

# Response API json serializer
gem "active_model_serializers", "~> 0.10.2"

# Pagination
gem "pagy"

# Search
gem "ransack", github: "activerecord-hackery/ransack"

# Config global variables
gem "config"

# Soft delete
gem "discard"

# Redis
gem "redis"

source "https://rubygems.org"

ruby "3.3.0"

gem "bootsnap", require: false
gem "importmap-rails"
gem "jbuilder"
gem "neighbor"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "rails", "~> 7.1.3", ">= 7.1.3.2"
gem "redis", ">= 4.0.1"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[windows jruby]

group :development, :test do
  gem "debug", platforms: %i[mri windows]
end

group :development do
  gem "rack-mini-profiler"
  gem "web-console"
end

group :production do
  gem "rack-timeout"
end

group :development, :test do
  gem "awesome_print"
  gem "better_errors"
  gem "binding_of_caller"
  gem "dotenv-rails"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "standard", require: false
end

group :development do
  gem "annotate"
  gem "bullet"
  gem "rails_db", ">= 2.3.1"
  gem "rails-erd"
end

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.2'
gem 'dotenv-rails'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap'
gem 'uglifier', '>= 1.3.0'
gem 'devise'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'dropzonejs-rails'
gem 'carrierwave'
gem 'mini_magick'
gem 'pg'
gem 'geocoder'
gem 'pg_search'
gem 'rack-cors'
gem 'active_model_serializers'
gem 'paper_trail'
gem 'redcarpet'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'tzinfo-data'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem "rspec-rails"
  gem "rails-controller-testing"
end

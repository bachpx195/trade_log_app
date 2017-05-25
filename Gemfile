source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem "rails-i18n", "~> 5.0.0"
gem "bootstrap-sass"
gem 'coffee-script-source', '1.8.0'

group :development, :test do
	gem 'rails-perftest'
	gem 'ruby-prof'
  gem "rspec-rails", "~> 3.0"
  gem "fabrication"
  gem 'byebug', '~> 9.0', '>= 9.0.5'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :test do
  gem "rspec-collection_matchers"
  gem "shoulda-matchers", "~> 3.0"
  gem "database_cleaner", "~> 1.5"
  gem "simplecov", require: false
  gem "rails-controller-testing"
end

group :assets do
  gem 'coffee-rails'
end

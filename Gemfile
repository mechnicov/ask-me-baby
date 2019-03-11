source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.2'
gem 'dotenv-rails', require: 'dotenv/rails-now', groups: [:development, :test]
gem 'pg'
gem 'jquery-rails'
gem 'faker'
gem 'rails-i18n', '~> 5.1'
gem 'haml-rails', '~> 1.0'
gem 'pagy'
gem 'uglifier'
gem 'recaptcha'#, require: 'recaptcha/rails'

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

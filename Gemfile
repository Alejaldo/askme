source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails',      '6.1.3.1'
gem 'puma',       '5.2.2'
gem 'sass-rails', '6.0.0'
gem 'webpacker',  '5.2.1'
gem 'turbolinks', '5.2.1'
gem 'jbuilder',   '2.10.0'
gem 'bootstrap-sass', '3.4.1'
gem 'bootsnap',   '1.7.2', require: false
gem 'jquery-rails'
gem 'uglifier'
gem 'dotenv-rails'
gem 'recaptcha'
gem 'where_exists'

group :development, :test do
  gem 'sqlite3', '1.4.2'
  gem 'byebug',  '11.1.3', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop', require: false
end

group :development do
  gem 'web-console', '4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '3.4.1'
  gem 'spring', '2.1.1'
  gem 'spring-watcher-listen', '2.0.1'
end

group :production do
  gem 'pg', '1.2.3'
end

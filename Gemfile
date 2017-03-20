source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'markdownjs-rails'
gem 'puma', '~> 3.0'
gem 'sprockets-es6'
gem 'sass-rails', '~> 5.0'

gem 'bootstrap-sass', '~> 3.3.7'
gem 'intercooler'
gem 'figaro', '~> 1.1.1'
gem 'redcarpet', '~> 3.4.0'
gem 'slim-rails', '~> 3.1.1'
gem 'trix', '~> 0.10.1'
gem 'pg', '~> 0.18'

gem 'carrierwave', '~> 1.0'

group :development, :test do
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'annotate'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'rails_real_favicon'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'yard'
end

group :test do
  gem 'rails-controller-testing'
  gem 'rspec-rails'
end

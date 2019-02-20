source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.2'
gem 'turbolinks'
gem 'uglifier'#, '>= 1.3.0'
gem 'jquery-rails'
gem 'markdownjs-rails'
gem 'puma'#, '~> 3.0'

gem 'sass-rails'#, '~> 5.0'
gem 'bootstrap-sass'#, '~> 3.3.7'

gem 'intercooler'
gem 'sprockets-es6'
gem 'trix'#, '~> 0.10.1'

gem 'figaro'#, '~> 1.1.1'
gem 'redcarpet'#, '~> 3.4.0'
gem 'slim-rails'#, '~> 3.1.1'

gem 'pg'#, '~> 0.18'
gem "mini_magick"#, '~> 4.6.1'
gem 'carrierwave'#, '~> 1.0'
gem 'action_cable_client'

gem 'loofah', '~> 2.2.1'

group :development, :test do
  gem 'factory_girl_rails'
  gem 'byebug'
  gem 'annotate'
end

group :development do
  gem 'listen'#, '~> 3.0.5'
  gem 'rails_real_favicon'
  gem 'spring'
  gem 'spring-watcher-listen'#, '~> 2.0.0'
  gem 'yard', '~> 0.9.11'

end

group :test do
  gem 'rails-controller-testing'
  gem 'rspec-rails'
end

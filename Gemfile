# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'pg', '~> 1.1'
gem 'rails', '~> 7.0.6'

gem 'bootsnap', require: false
gem 'puma', '~> 5.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# For testing you can check out the gem and interactively debug things
# You'll need to change the path depending on your setup
# gem 'koyo-postgres-replication', path: '../../koyo/koyo-postgres-replication'

# For testing against git repro
# gem 'koyo-postgres-replication',
#     git: 'https://github.com/wiseleyb/koyo-postgres-replication',
#     require: 'koyo'

gem 'koyo-postgres-replication', '0.1.0.pre', require: 'koyo'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
end

group :test do
  gem 'database_cleaner-active_record'
end

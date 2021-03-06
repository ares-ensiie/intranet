source 'https://rubygems.org'

ruby '2.1.2'
gem 'rails', '4.1.6'

gem 'sass-rails', '~> 4.0.3'
gem 'coffee-rails', '~> 4.0.1'
gem 'bootstrap-sass'
gem 'bootstrap-addons-rails', '~> 0.1.2'
gem 'bootstrap-datepicker-rails'
gem 'chosen-rails'
gem 'jquery-rails'
gem 'jquery-fileupload-rails'
gem 'select2-rails'
gem 'uglifier', '>= 1.0.3'
gem 'asset_sync' # sync assets with s3 or openstack
gem 'favicon_maker'
gem 'turbolinks'
gem 'inherited_resources'

# i18n
gem 'rails-i18n'

# Database
gem 'mongoid', github: 'mongoid/mongoid'

# Authentication & authorization
gem 'devise'
gem 'doorkeeper', '~> 1.4.0'
gem 'cancancan'

# Templates
gem 'placeholder'
gem 'haml'
gem 'simple_form'
gem 'redcarpet'
gem 'pygments.rb'
gem 'high_voltage'

# API
gem 'rabl'

# Other
gem 'mongoid-paperclip' # uploads
gem 'mongoid_slug'
gem 'kaminari' # pagination
gem 'tire' # ElasticSearch
gem 'fog'

group :production, :staging do
  gem 'newrelic_rpm'
  gem 'puma'
end

group :development, :test do
  gem 'rake'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'json_spec'
  gem 'rspec-rails'
  gem 'mongoid-rspec'
  gem 'sextant'
  gem 'parallel_tests'
  gem 'guard-rspec'
  gem 'terminal-notifier-guard'

  # debug
  gem 'pry'
  gem 'pry-remote'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
end

gem 'rails_admin'
gem 'rails_admin-i18n'
gem 'rollbar'
gem 'rails_12factor'
gem 'nprogress-rails'

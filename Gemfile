source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '3.2.12'

group :assets do
  gem 'sass-rails', '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'bootstrap-sass'
  gem 'bootstrap-addons-rails'
  gem 'bootstrap-datepicker-rails'
  gem 'chosen-rails'
  gem 'jquery-rails'
  gem 'jquery-fileupload-rails'
  gem 'select2-rails'
  gem 'uglifier', '>= 1.0.3'
  gem 'asset_sync' # sync assets with s3 or openstack
end

# Database
gem 'mongoid', '~> 3.1.0'

# Authentication & authorization
gem 'devise'
gem 'doorkeeper'
gem 'cancan'

# Templates
gem 'placeholder'
gem 'haml'
gem 'simple_form'

# API
gem 'rabl'

# Other
gem 'mongoid-paperclip' # uploads
gem 'mongoid_slug'
gem 'kaminari' # pagination
gem 'tire' # ElasticSearch
gem 'fog', github: 'fog/fog', branch: 'master'

group :production, :staging do
  gem 'newrelic_rpm'
  gem 'puma'
end

group :development, :test do
  # testing
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'json_spec'
  gem 'rspec-rails'
  gem 'mongoid-rspec'
  gem 'sextant'
  gem 'rb-inotify'
  gem 'guard-rspec'

  # debug
  gem 'pry'
  gem 'pry-remote'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'

end

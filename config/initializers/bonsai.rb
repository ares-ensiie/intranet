if Rails.env.staging? or Rails.env.production? then
  ENV['ELASTICSEARCH_URL'] = ENV['BONSAI_URL']
  app_name = Rails.application.class.parent_name.underscore.dasherize
  app_env = Rails.env
  INDEX_NAME = "#{app_name}-#{app_env}"
end

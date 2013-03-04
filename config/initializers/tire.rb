ENV['ELASTICSEARCH_URL'] = ENV['BONSAI_URL']
Tire::Model::Search.index_prefix "#{Rails.application.class.parent_name.downcase}_#{Rails.env.to_s.downcase}"

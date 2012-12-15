class Oauth::Application < Doorkeeper::Application
  include Mongoid::Document
  include Mongoid::Slug

  slug :name
end

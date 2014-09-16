class Oauth::Application < Doorkeeper::Application
  include Mongoid::Document
  include Mongoid::Slug

  slug :name

  rails_admin do
    list do
      field :name
      field :owner
    end
  end
end

class Promotion
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  has_many :students, class_name: 'User'

  field :name

  slug :name

  default_scope -> { order_by(name: :desc) }

  validates :name, presence: true, uniqueness: true

  rails_admin do
    list do
      field :name
      field :students do
        pretty_value do
          value.count
        end
      end
    end
  end
end

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  include Mongoid::Paperclip
  include Tire::Model::Search
  include Tire::Model::Callbacks

  has_mongoid_attached_file :avatar, 
    styles: { 
      mini: "50x50#",
      thumb: "150x150#",
      original: "500x500>"
    }

  devise :database_authenticatable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessible :username, :email, :avatar,
    :first_name, :last_name, :gender,
    :password, :password_confirmation, :remember_me,
    :confirmed_at, :promotion

  belongs_to :promotion, inverse_of: :students

  has_many :albums, class_name: "Gallery::Album", inverse_of: :author
  has_many :documents, class_name: "Courses::Document", inverse_of: :author

  has_many :oauth_applications, class_name: '::Oauth::Application', as: :owner

  field :username
  field :email
  field :first_name
  field :last_name
  field :nick_name

  field :encrypted_password

  field :is_admin, type: Boolean, default: false
  # Default male is not sexism, it's reality !
  field :gender, type: String, default: 'M'
  validates :gender, inclusion: { in: ["M", "F"] }


  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count, type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at, type: Time
  field :current_sign_in_ip
  field :last_sign_in_ip

  ## Confirmable
  field :confirmed_at, type: DateTime
  field :confirmation_token
  field :confirmation_sent_at, type: DateTime

  slug :username

  default_scope order_by([:username, :asc])

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :promotion, presence: true


  mapping do
    indexes :id
    indexes :username, analyzer: 'keyword'
    indexes :first_name
    indexes :last_name
    indexes :name, boost: 2.0
  end

  def to_indexed_json
    Rabl::Renderer.json(self, 'api/v1/users/user', view_path: 'app/views')
  end

  def self.search(q: '*', promotions: [])
    tire.search load: true, per_page: 1000 do
      query { string q }
      filter :terms, promotion: promotions if promotions.any?
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  alias_method :is_admin?, :is_admin

  def self.paginate(options = {})
    page(options[:page]).per(options[:per_page])
  end

  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end

  def has_no_password?
    self.encrypted_password.blank?
  end

  def only_if_unconfirmed
    pending_any_confirmation { yield }
  end

  def password_required?
    # Password is required if it is being set, but not for new records
    if !persisted?
      false
    else
      !password.nil? || !password_confirmation.nil?
    end
  end

  def is_document_owner?
    return Courses::Document.where(author: self).count
  end

end

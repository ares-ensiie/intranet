class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  devise :database_authenticatable, :rememberable, :trackable, :validatable, :omniauthable,
    :confirmable

  attr_accessible :username, :email,
    :first_name, :last_name,
    :password, :password_confirmation, :remember_me,
    :confirmed_at, :promotion

  belongs_to :promotion, inverse_of: :students
  has_many :ragots, class_name: "Ragot", inverse_of: :author
  has_many :albums, class_name: "Album", inverse_of: :author
  has_many :documents, class_name: "Document", inverse_of: :author
  has_many :oauth_applications, class_name: '::Oauth::Application', as: :owner

  field :username
  field :email
  field :first_name
  field :last_name
  field :encrypted_password

  field :is_admin, type: Boolean, default: false

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

  def name
    "#{first_name} #{last_name}"
  end

  alias_method :is_admin?, :is_admin

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
end

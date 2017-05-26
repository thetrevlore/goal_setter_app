class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token

  attr_reader :password

  has_many :goals,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Goal

  has_many :comments,
    primary_key: :id,
    foreign_key: :authour_id,
    class_name: :Comment

  has_many :views,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :View

    has_many :viewees,
      through: :goals,
      source: :views

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    debugger
    return nil if user.nil?
    if user.is_password?(password)
      user
    else
      nil
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def generate_session_token
    self.session_token = SecureRandom.urlsafe_base64(16)

    # .exists? active record method will help detect session_token collision
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end


end

class User < ApplicationRecord
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return if user.nil?
    bcrypt_password = BCrypt::Password.new(user.password_digest)
    user if bcrypt_password == password
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6 }, allow_nil: true
  before_validation :ensure_session_token

  attr_reader :password

  def password=(other)
    @password = other
    self.password_digest = BCrypt::Password.create(other)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    save!
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end

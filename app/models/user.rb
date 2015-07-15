class User < ActiveRecord::Base
  attr_accessor :remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save  {self.email = email.downcase}
  validates :name ,  presence: true, length: {maximum:  50}
  validates :email ,  presence: true, length: {maximum: 250},
    format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  validates :password, presence: true

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end

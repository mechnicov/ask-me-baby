require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20_000.freeze
  DIGEST = OpenSSL::Digest::SHA256.new.freeze
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  VALID_USERNAME_REGEX = /\A\w+\z/.freeze
  VALID_COLOR_REGEX = /\A#([\da-f]{3}){1,2}\z/i.freeze
  MAX_NAME_LENGTH = 40.freeze

  attr_accessor :password

  has_many :questions
  validates :username, presence: true, uniqueness: true,
                       length: { maximum: MAX_NAME_LENGTH },
                       format: { with: VALID_USERNAME_REGEX }
  validates :email, presence: true, uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true
  validates :password, presence: true, on: :create
  validates_confirmation_of :password
  validates :bgcolor, format: { with: VALID_COLOR_REGEX }, allow_blank: true
  before_validation :downcase_email_and_username
  before_save :encrypt_password

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    email.downcase!
    user = find_by(email: email)
    return nil unless user.present?

    hashed_password = User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password,
                                                                     user.password_salt,
                                                                     ITERATIONS,
                                                                     DIGEST.length,
                                                                     DIGEST))
    return user if user.password_hash == hashed_password
    nil
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password,
                                                                          password_salt,
                                                                          ITERATIONS,
                                                                          DIGEST.length,
                                                                          DIGEST))
    end
  end

  def downcase_email_and_username
    email.downcase! if email.present?
    username.downcase! if username.present?
  end
end

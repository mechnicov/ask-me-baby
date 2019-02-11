require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest::SHA256.new
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_USERNAME_REGEX = /\A\w+\z/

  attr_accessor :password

  has_many :questions
  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       length: { maximum: 40 }, format: { with: VALID_USERNAME_REGEX }
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  validates :password, presence: true, on: :create, confirmation: true
  before_save :encrypt_password, :downcase_email_and_username

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
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
    email.downcase!
    username.downcase!
  end
end

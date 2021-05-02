require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_USERNAME = /\A[\w]*\z/

  attr_accessor :password

  has_many :questions

  before_validation :lowercase
  before_save :encrypt_password 

  validates :password, presence: true, on: :create, confirmation: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL }
  validates :username, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: VALID_USERNAME }

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email.downcase)

    if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end 

  private

  def lowercase
      username&.downcase! if username.present?
      email&.downcase! if email.present?
  end

  def encrypt_password
    if self.password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATIONS, DIGEST.length, DIGEST))
    end
  end 
end

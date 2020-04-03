class User < ApplicationRecord
  has_secure_password
  attr_accessor :remember_token
  has_many :posts

  def User.new_token
    Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64)
  end

  def remember
    self.remember_token = User.new_token
    self[:remember_digest] = remember_token
  end

  def forget
    self[:remember_digest] = nil
  end
end

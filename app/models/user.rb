# frozen_string_literal: true

class User < ApplicationRecord

  has_many :orders
  has_many :ratings
  has_secure_password
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save { self.email = email.downcase }
  attr_accessor :remember_token, :activation_token
  before_save                    :downcase_email
  before_create                  :create_activation_digest
  validates :user_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
                                                  BCrypt::Password.create(string, cost: cost)
  end
  def self.new_token 
    SecureRandom.urlsafe_base64
  end
  def digest
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  def new_token
    SecureRandom.urlsafe_base64
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  private
  def downcase_email
    self.email = email.downcase
  end
  def activate
    update_attribute(:activated,true)
    update_attribute(:activated_at, Time.zone.now)
  end
  def create_activation_digest
    self.activation_token = User.new_token
  end
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
    # update dc 1 attribute cua object do 
    # update_at van cap nhap 
    # callback van chay
    # bo qua validate
  end
end

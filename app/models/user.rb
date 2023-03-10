class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 5 }, allow_nil: true
    default_scope -> { order(updated_at: :desc)}
    enum :role, [ :developer, :qa, :manager ]
    has_secure_password
    
    has_many :projects, dependent: :destroy
end
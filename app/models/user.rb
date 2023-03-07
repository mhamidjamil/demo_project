class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true, length: { minimum: 5 }, allow_nil: true
    default_scope -> { order(updated_at: :desc)}
    enum :role, [ :developer, :qa, :manager ]
    has_secure_password
end
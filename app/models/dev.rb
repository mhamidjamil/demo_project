class Dev < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    enum :role, [ :developer, :qa, :manager ]
    has_many :projects, dependent: :destroy
    
end

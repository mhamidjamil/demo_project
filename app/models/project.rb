class Project < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true, length: {minimum: 5, maximum: 500}

    has_many :project_bugs, dependent: :destroy
    has_many :bugs, through: :project_bugs
    
    belongs_to :user
end
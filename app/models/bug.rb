class Bug < ApplicationRecord
    #title must be present and must be unique
    validates :title, presence: true, uniqueness: true

    # enum :status, [ :new, :started, :resolved, :closed ]
    # enum status: { new: 1, started: 2, resolved: 3 }
    validates :status, presence: true
    
    enum :btype, [ :bug, :feature ]
    validates :btype, presence: true
    
    has_many :project_bugs
    has_many :projects, through: :project_bugs
    default_scope -> { order(updated_at: :desc)}

    mount_uploader :image, ImageUploader 
end
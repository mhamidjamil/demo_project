class Bug < ApplicationRecord
    #title must be present and must be unique
    validates :title, presence: true, uniqueness: true
    validates :btype, presence: true
    validates :status, presence: true

    enum :btype, [ :bug, :feature ]
    has_many :project_bugs

    default_scope -> { order(updated_at: :desc)}
end
class ProjectBug < ApplicationRecord
    belongs_to :project 
    belongs_to :bug
    validates :user_id, presence: true
  end
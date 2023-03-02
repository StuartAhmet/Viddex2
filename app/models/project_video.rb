class ProjectVideo < ApplicationRecord
  belongs_to :project, dependent: :destroy
  belongs_to :video
end

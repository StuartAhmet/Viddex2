class ProjectVideo < ApplicationRecord
  belongs_to :project
  belongs_to :video
end

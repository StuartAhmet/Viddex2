class ProjectLink < ApplicationRecord
  belongs_to :project
  belongs_to :background
  belongs_to :video
  belongs_to :audio

  validates :project, uniqueness: { scope: :video, message: "This video has already been linked to your project" }

end

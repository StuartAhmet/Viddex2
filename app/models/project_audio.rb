class ProjectAudio < ApplicationRecord
  belongs_to :project
  belongs_to :audio
end

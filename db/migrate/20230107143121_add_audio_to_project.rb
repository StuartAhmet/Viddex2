class AddAudioToProject < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :audio, foreign_key: true
  end
end

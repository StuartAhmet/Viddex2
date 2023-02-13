class CreateProjectAudios < ActiveRecord::Migration[7.0]
  def change
    create_table :project_audios do |t|
      t.integer :project_id
      t.integer :audio_id
      t.timestamps
    end

    add_index :project_audios, [:project_id, :audio_id], unique: true
  end
end

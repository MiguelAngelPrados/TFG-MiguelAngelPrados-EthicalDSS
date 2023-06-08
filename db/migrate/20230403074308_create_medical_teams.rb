class CreateMedicalTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_teams do |t|
      t.string :specialization

      t.timestamps
    end
  end
end

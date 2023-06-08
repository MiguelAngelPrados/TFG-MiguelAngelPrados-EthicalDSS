class CreateInterventions < ActiveRecord::Migration[7.0]
  def change
    create_table :interventions do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :medical_team, null: false, foreign_key: true
      t.text :procedure
      t.boolean :patient_judgement
      t.boolean :family_criteria

      t.timestamps
    end
  end
end

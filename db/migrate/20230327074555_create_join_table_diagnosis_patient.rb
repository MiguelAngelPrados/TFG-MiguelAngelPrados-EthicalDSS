class CreateJoinTableDiagnosisPatient < ActiveRecord::Migration[7.0]
  def change
    create_join_table :diagnoses, :patients do |t|
      # t.index [:diagnosis_id, :patient_id]
      # t.index [:patient_id, :diagnosis_id]
    end
  end
end

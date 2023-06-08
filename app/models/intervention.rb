class Intervention < ApplicationRecord
    belongs_to :patient
    belongs_to :medical_team

    validates :medical_team_id, uniqueness: { scope: :patient_id, message: "and patient are unique" }
end

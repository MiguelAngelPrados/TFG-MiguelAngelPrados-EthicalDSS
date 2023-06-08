class MedicalTeam < ApplicationRecord
    has_many :interventions
    has_many :patients, through: :interventions

    validates :specialization, presence: true, uniqueness: true
end
